import mysql from 'promise-mysql'
import keys from './keys';

const pool  = mysql.createPool(keys.database);

pool.getConnection((err : any, conn: any) => {
    if(err){
        if(err.code === "PROTOCOL_CONNECTION_LOST")
            console.error("DB Connection was closed");
        if(err.code === "ER_CON_COUNT_ERROR")
            console.error("DB has too many connections");
        if(err.code === "ECONNREFUSED")
            console.error("DB connection was refused");
    }

    if(conn) conn.release();
    console.log('DB is connected');
    return;
});

module.exports = pool;
