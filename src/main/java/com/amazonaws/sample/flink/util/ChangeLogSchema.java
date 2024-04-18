package com.amazonaws.sample.flink.util;

public class ChangeLogSchema<T> {
    String before;
    String after;
    String source;
    String op;
    String ts;
    String transaction;

    public ChangeLogSchema(String _before, String _after, String _source, String _op, String _ts, String _transaction) {
        this.before = _before;
        this.after = _after;
        this.source = _source;
        this.op = _op;
        this.ts = _ts;
        this.transaction = _transaction;
    }

    public String get_before() {
        return before;
    }

    public String get_after() {
        return after;
    }

    public String get_source() {
        return source;
    }

    public String get_op() {
        return op;
    }

    public String get_ts() {
        return ts;
    }

    public String get_transaction() {
        return transaction;
    }

    public void set_before(String _before) {
        this.before = _before;
    }

    public void set_after(String _after) {
        this.after = _after;
    }

    public void set_source(String _source) {
        this.source = _source;
    }

    public void set_op(String _op) {
        this.op = _op;
    }

    public void set_ts(String _ts) {
        this.ts = _ts;
    }

    public void set_transaction(String _transaction) {
        this.transaction = _transaction;
    }


}
