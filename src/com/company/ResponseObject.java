package com.company;

public class ResponseObject {
    private String msg;
    private int state = 1;
    private Object datas;
    private int page;
    private int size;
    private int count;

    public int getPage(){
        return page;
    }
    public void setPage(){
        this.page = page;
    }
    public int getSize(){
        return size;
    }
    public void setSize(int size){
        this.size = size;
    }
    public int getCount(){
        return count;
    }
    public void setCount(int count){
        this.count = count;
    }
    public ResponseObject(int state,String msg){
        this.state = state;
        this.msg = msg;
    }
    public ResponseObject(int state,Object datas){
        this.state = state;
        this.datas = datas;
    }
    public ResponseObject(int state,String msg,Object datas){
        this.state = state;
        this.msg = msg;
        this.datas = datas;
    }
    public String getMsg(){
        return msg;
    }
}
