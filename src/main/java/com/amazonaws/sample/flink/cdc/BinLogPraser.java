package com.amazonaws.sample.flink.cdc;

import org.apache.flink.api.common.functions.MapFunction;
import org.apache.flink.api.java.tuple.Tuple2;

import com.amazonaws.sample.flink.util.ChangeLogSchema;
import com.amazonaws.sample.flink.util.DatasetL1;
import com.fasterxml.jackson.databind.ObjectMapper;

public class BinLogPraser implements MapFunction<String,Tuple2<String,DatasetL1>>{

    @SuppressWarnings("rawtypes")
    @Override
    public Tuple2<String, DatasetL1> map(String value) throws Exception {
        // TODO Auto-generated method stub
        ObjectMapper objectMapper = new ObjectMapper();
        ChangeLogSchema line = objectMapper.readValue(value, ChangeLogSchema.class);
        
        String source = line.get_source();
        

        String op = line.get_op();
        if(op.equals("r") || op.equals("c")) {

        } else if(op.equals("u")) {

        } else if(op.equals("d")) {

        }
        

        return null;
    }

}
