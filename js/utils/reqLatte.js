/**
 * Created by anik1 on 27.11.2016.
 */
'use strict'

/**
 * Делает отложенные запросы
 */
class ReqLatte {
    /**
     * @constructor
     * @param {function} methodGet - Метод, достающий данные извне
     * @param {object} db - Внутреннее хранилище, кэш, вобщем место в котором храняться данные
     * @param {number} delay - Задержка перед вызовом methodGet
     */
    constructor({
        methodGet = mandatory(),
        db,
        delay = 0
    }) {
        this.db = db || {
                get: (hash)=> {
                },
                has: (hash)=> false,
                set: (hash, data)=> {
                },
                setMany: (items)=> {
                },
                remove: (hash)=> {
                }
            }
        this.callbacks = {}//Место в котором собираются подписчики на результаты methodGet
        this.methodGet = methodGet
        this.gearWorking = false
        this.delay = delay
    }

    /**
     * Достаем данные, можно по одиночке, а можно и целой пачкой
     */
    get(what) {
        if (Object.prototype.toString.call(what) === '[object Array]') return this._getMany(what)
        else return this._getOne(what)
    }

    /**
     * Достаем данные только пачкой, но если не получили хотябы одно поле - reject
     */
    // getStrict(whats) {
    //     return Promise.all(whats.map(what=> this.get(what)))
    // }

    _getOne(what) {
        if (this.db.has(what)) return Promise.resolve(this.db.get(what))
        this.callbacks[what] = this.callbacks[what] || {
                fetching: false,
                listeners: []
            }
        let cb = {}
        let prom = new Promise((resolve, reject)=> {
            cb.resolve = resolve
            cb.reject = reject
        })
        this.callbacks[what].listeners.push(cb)
        this._runGear()
        return prom;
    }

    _getMany(whats) {
        return Promise.all(whats.map(what=> {
            return new Promise(resolve=> this.get(what).then(resolve).catch(err=> resolve()))
        })).then(res=> res.reduce((prev, cur, index)=> {
            if (cur === undefined) return prev;
            prev[whats[index]] = cur
            return prev;
        }, {}))
    }

    _gear() {
        let keys = Object.keys(this.callbacks).filter(k=> !this.callbacks[k].fetching)
        if (keys.length === 0) return;
        keys.forEach(k=> this.callbacks[k].fetching = true)
        this.methodGet(keys).then(res=> {
            let answerKeys = Object.keys(res)
            this.db.setMany(res)
            answerKeys.forEach(key=> this._sendSuccess(key, res[key]))
            keys.forEach(key=> {
                if (answerKeys.indexOf(key) === -1) this._sendError(key, new Error('No resp for ' + key))
            })
            this._runGear()
        }).catch(err=> {
            console.error(err.stack)
            keys.forEach(key=> this._sendError(key, new Error('No resp for ' + key)))
        })
    }

    _sendSuccess(key, data) {
        this._getListeners(key).forEach(cb=>cb.resolve(data))
        delete this.callbacks[key]
    }

    _sendError(key, err) {
        this._getListeners(key).forEach(cb=>cb.reject(new Error('No resp for ' + key)))
        delete this.callbacks[key]
    }

    _getListeners(key) {
        if (!this.callbacks.hasOwnProperty(key)) {
            console.warn(`Resp returned unknown key "${key}"`)
            return []
        }
        return this.callbacks[key].listeners
    }

    _runGear() {
        if (this.gearWorking) return;
        if (Object.keys(this.callbacks).filter(k=>!this.callbacks[k].fetching).length > 0) {
            this.gearWorking = true
            setTimeout(()=> {
                this.gearWorking = false
                this._gear()
            }, this.delay)
        }
    }
}

module.exports = ReqLatte