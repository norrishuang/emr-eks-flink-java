package com.amazonaws.emr.flink;

public class CustomerCount {
    private String customer;
    private int count;

    public CustomerCount(String customer, int count) {
        this.customer = customer;
        this.count = count;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
