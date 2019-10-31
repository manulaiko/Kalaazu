package com.kalaazu.persistence.entity;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "vouchers", schema = "kalaazu", catalog = "")
public class VouchersEntity {
    private short  id;
    private String code;
    private byte   limit;

    @Id
    @Column(name = "id", nullable = false)
    public short getId() {
        return id;
    }

    public void setId(short id) {
        this.id = id;
    }

    @Basic
    @Column(name = "code", nullable = false, length = 32)
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Basic
    @Column(name = "limit", nullable = false)
    public byte getLimit() {
        return limit;
    }

    public void setLimit(byte limit) {
        this.limit = limit;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        VouchersEntity that = (VouchersEntity) o;
        return id == that.id &&
               limit == that.limit &&
               Objects.equals(code, that.code);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, code, limit);
    }
}
