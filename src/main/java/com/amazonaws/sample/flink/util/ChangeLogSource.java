package com.amazonaws.sample.flink.util;

public class ChangeLogSource {

    private String db;

    private String table;


    public String getDb() {
        return db;
    }

    public String getTable() {
        return table;
    }

    public void setDb(String db) {
        this.db = db;
    }

    public void setTable(String table) {
        this.table = table;
    }

}
