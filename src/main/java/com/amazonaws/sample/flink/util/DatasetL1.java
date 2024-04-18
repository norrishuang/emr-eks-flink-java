package com.amazonaws.sample.flink.util;

public class DatasetL1 {

    private String _op;
    private String _database_name;
    private String _table_name;
    private String _data_json;

    public DatasetL1(String _op, String _database_name, String _table_name, String _data_json) {
        this._op = _op;
        this._database_name = _database_name;
        this._table_name = _table_name;
        this._data_json = _data_json;
    }
    

    public String get_op() {
        return _op;
    }

    public String get_database_name() {
        return _database_name;
    }

    public String get_table_name() {
        return _table_name;
    }

    public String get_data_json() {
        return _data_json;
    }

    public void set_op(String _op) {
        this._op = _op;
    }
    public void set_database_name(String _database_name) {
        this._database_name = _database_name;
    }
    
    public void set_table_name(String _table_name) {
        this._table_name = _table_name;
    }

    public void set_data_json(String _data_json) {
        this._data_json = _data_json;
    }

    

}
