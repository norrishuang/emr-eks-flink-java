package com.amazonaws.sample.flink.cdc;

import org.apache.flink.api.java.tuple.Tuple2;

import com.amazonaws.sample.flink.util.ChangeLogSchema;
import com.amazonaws.sample.flink.util.ChangeLogSource;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;


/**
 * Praser Op = u/c 
 * get dbname,tablename
 */
public class InsertPraser {

    public Tuple2<String,String> parse(ChangeLogSchema line) throws JsonMappingException, JsonProcessingException {

        String beforeJson = line.get_source();

        ObjectMapper objectMapper = new ObjectMapper();
        ChangeLogSource source = objectMapper.readValue(beforeJson, ChangeLogSource.class);

        String db_and_table = source.getDb() + "|" + source.getTable();
        
        Tuple2<String,String> tuple2 = new Tuple2<String,String>(db_and_table, line.get_after());
        
        return tuple2;
    }

}
