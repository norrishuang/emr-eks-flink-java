package com.amazonaws.sample.flink.util;

public class ChangeLogSchema<T> {
    String _before;
    String _after;
    String _source;
    String _op;
    String _ts;
    String _transaction;

    public ChangeLogSchema(String _before, String _after, String _source, String _op, String _ts, String _transaction) {
        this._before = _before;
        this._after = _after;
        this._source = _source;
        this._op = _op;
        this._ts = _ts;
        this._transaction = _transaction;
    }

    public String get_before() {
        return _before;
    }

    public String get_after() {
        return _after;
    }

    public String get_source() {
        return _source;
    }

    public String get_op() {
        return _op;
    }

    public String get_ts() {
        return _ts;
    }

    public String get_transaction() {
        return _transaction;
    }

    public void set_before(String _before) {
        this._before = _before;
    }

    public void set_after(String _after) {
        this._after = _after;
    }

    public void set_source(String _source) {
        this._source = _source;
    }

    public void set_op(String _op) {
        this._op = _op;
    }

    public void set_ts(String _ts) {
        this._ts = _ts;
    }

    public void set_transaction(String _transaction) {
        this._transaction = _transaction;
    }


}
