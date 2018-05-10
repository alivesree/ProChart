dataSource {
    pooled = true
    jmxExport = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    //    cache.region.factory_class = 'org.hibernate.cache.SingletonEhCacheRegionFactory' // Hibernate 3
    cache.region.factory_class = 'org.hibernate.cache.ehcache.SingletonEhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
    flush.mode = 'manual' // OSIV session flush mode outside of transactional context
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "none"
            url = "jdbc:mysql://localhost:3306/prochart"
            //url = "jdbc:mysql://localhost:3306/o2msiju"
            //url = "jdbc:mysql://localhost:3306/o2mdb162"
            //url = "jdbc:mysql://localhost:3210/o2mdb"
            driverClassName = "com.mysql.jdbc.Driver"
            username = "root"//o2musr
            //password = "sqlhtlo2m15"
            password = "root"//htl#o215
            dialect = org.hibernate.dialect.MySQL5InnoDBDialect
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://localhost:3306/prochartTest"
            //url = "jdbc:mysql://localhost:3306/o2msiju"
            //url = "jdbc:mysql://localhost:3306/o2mdb162"
            //url = "jdbc:mysql://localhost:3210/o2mdb"
            driverClassName = "com.mysql.jdbc.Driver"
            username = "root"//o2musr
            //password = "sqlhtlo2m15"
            password = "htl#sql"//htl#o215
            dialect = org.hibernate.dialect.MySQL5InnoDBDialect
        }
    }
    production {
        dataSource {
            dbCreate = "none"
            url = "jdbc:mysql://localhost:3306/prochart"
            //url = "jdbc:mysql://localhost:3306/o2msiju"
            //url = "jdbc:mysql://localhost:3306/o2mdb162"
            //url = "jdbc:mysql://localhost:3210/o2mdb"
            driverClassName = "com.mysql.jdbc.Driver"
            username = "root"//o2musr
            //password = "sqlhtlo2m15"
            password = "ikyaSql"//htl#o215
            dialect = org.hibernate.dialect.MySQL5InnoDBDialect
            properties {
                // See http://grails.org/doc/latest/guide/conf.html#dataSource for documentation
                jmxEnabled = true
                initialSize = 5
                maxActive = 50
                minIdle = 5
                maxIdle = 25
                maxWait = 10000
                maxAge = 10 * 60000
                timeBetweenEvictionRunsMillis = 5000
                minEvictableIdleTimeMillis = 60000
                validationQuery = "SELECT 1"
                validationQueryTimeout = 3
                validationInterval = 15000
                testOnBorrow = true
                testWhileIdle = true
                testOnReturn = false
                jdbcInterceptors = "ConnectionState"
                defaultTransactionIsolation = java.sql.Connection.TRANSACTION_READ_COMMITTED
            }
        }
    }
}
