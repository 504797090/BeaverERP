package com.beaver.bean.to;

import lombok.Data;

import javax.websocket.Session;
import java.io.Serializable;

@Data
public class Client implements Serializable {

    private static final long serialVersionUID = 8957107006902627635L;

    private String userName;

    private Session session;

    public Client(String userName, Session session) {
        this.userName = userName;
        this.session = session;
    }
}
