#!/usr/local/bin/sh

if test ! -f $cactidir/rra/apache2_ap2busyworkers_8.rrd; then
$bindir/rrdtool create \
$cactidir/rra/apache2_ap2busyworkers_8.rrd \
--step 300  \
DS:ap2BusyWorkers:GAUGE:600:0:U \
RRA:AVERAGE:0.5:1:600 \
RRA:AVERAGE:0.5:6:700 \
RRA:AVERAGE:0.5:24:775 \
RRA:AVERAGE:0.5:288:797 \
RRA:MAX:0.5:1:600 \
RRA:MAX:0.5:6:700 \
RRA:MAX:0.5:24:775 \
RRA:MAX:0.5:288:797
fi
if test ! -f $cactidir/rra/apache2_ap2idleworkers_9.rrd; then
$bindir/rrdtool create \
$cactidir/rra/apache2_ap2idleworkers_9.rrd \
--step 300  \
DS:ap2IdleWorkers:GAUGE:600:0:U \
RRA:AVERAGE:0.5:1:600 \
RRA:AVERAGE:0.5:6:700 \
RRA:AVERAGE:0.5:24:775 \
RRA:AVERAGE:0.5:288:797 \
RRA:MAX:0.5:1:600 \
RRA:MAX:0.5:6:700 \
RRA:MAX:0.5:24:775 \
RRA:MAX:0.5:288:797
fi
if test ! -f $cactidir/rra/apache2_ap2kbytesperrequest_14.rrd; then
$bindir/rrdtool create \
$cactidir/rra/apache2_ap2kbytesperrequest_14.rrd \
--step 300  \
DS:ap2KBytesPerRequest:GAUGE:600:0:U \
RRA:AVERAGE:0.5:1:600 \
RRA:AVERAGE:0.5:6:700 \
RRA:AVERAGE:0.5:24:775 \
RRA:AVERAGE:0.5:288:797 \
RRA:MAX:0.5:1:600 \
RRA:MAX:0.5:6:700 \
RRA:MAX:0.5:24:775 \
RRA:MAX:0.5:288:797
fi
if test ! -f $cactidir/rra/apache2_ap2requestspersec_13.rrd; then
$bindir/rrdtool create \
$cactidir/rra/apache2_ap2requestspersec_13.rrd \
--step 300  \
DS:ap2RequestsPerSec:GAUGE:600:0:U \
RRA:AVERAGE:0.5:1:600 \
RRA:AVERAGE:0.5:6:700 \
RRA:AVERAGE:0.5:24:775 \
RRA:AVERAGE:0.5:288:797 \
RRA:MAX:0.5:1:600 \
RRA:MAX:0.5:6:700 \
RRA:MAX:0.5:24:775 \
RRA:MAX:0.5:288:797
fi
if test ! -f $cactidir/rra/apache2_ap2totaltraffic_12.rrd; then
$bindir/rrdtool create \
$cactidir/rra/apache2_ap2totaltraffic_12.rrd \
--step 300  \
DS:ap2TotalTraffic:COUNTER:600:0:U \
RRA:AVERAGE:0.5:1:600 \
RRA:AVERAGE:0.5:6:700 \
RRA:AVERAGE:0.5:24:775 \
RRA:AVERAGE:0.5:288:797 \
RRA:MAX:0.5:1:600 \
RRA:MAX:0.5:6:700 \
RRA:MAX:0.5:24:775 \
RRA:MAX:0.5:288:797
fi
if test ! -f $cactidir/rra/localhost_load_1min_5.rrd; then
$bindir/rrdtool create \
$cactidir/rra/localhost_load_1min_5.rrd \
--step 300  \
DS:load_1min:GAUGE:600:0:500 \
DS:load_5min:GAUGE:600:0:500 \
DS:load_15min:GAUGE:600:0:500 \
RRA:AVERAGE:0.5:1:600 \
RRA:AVERAGE:0.5:6:700 \
RRA:AVERAGE:0.5:24:775 \
RRA:AVERAGE:0.5:288:797 \
RRA:MAX:0.5:1:600 \
RRA:MAX:0.5:6:700 \
RRA:MAX:0.5:24:775 \
RRA:MAX:0.5:288:797
fi
if test ! -f $cactidir/rra/localhost_users_6.rrd; then
$bindir/rrdtool create \
$cactidir/rra/localhost_users_6.rrd \
--step 300  \
DS:users:GAUGE:600:0:500 \
RRA:AVERAGE:0.5:1:600 \
RRA:AVERAGE:0.5:6:700 \
RRA:AVERAGE:0.5:24:775 \
RRA:AVERAGE:0.5:288:797 \
RRA:MAX:0.5:1:600 \
RRA:MAX:0.5:6:700 \
RRA:MAX:0.5:24:775 \
RRA:MAX:0.5:288:797
fi
if test ! -f $cactidir/rra/localhost_mem_buffers_3.rrd; then
$bindir/rrdtool create \
$cactidir/rra/localhost_mem_buffers_3.rrd \
--step 300  \
DS:mem_buffers:GAUGE:600:0:U \
RRA:AVERAGE:0.5:1:600 \
RRA:AVERAGE:0.5:6:700 \
RRA:AVERAGE:0.5:24:775 \
RRA:AVERAGE:0.5:288:797 \
RRA:MAX:0.5:1:600 \
RRA:MAX:0.5:6:700 \
RRA:MAX:0.5:24:775 \
RRA:MAX:0.5:288:797
fi
if test ! -f $cactidir/rra/localhost_mem_swap_4.rrd; then
$bindir/rrdtool create \
$cactidir/rra/localhost_mem_swap_4.rrd \
--step 300  \
DS:mem_swap:GAUGE:600:0:U \
RRA:AVERAGE:0.5:1:600 \
RRA:AVERAGE:0.5:6:700 \
RRA:AVERAGE:0.5:24:775 \
RRA:AVERAGE:0.5:288:797 \
RRA:MAX:0.5:1:600 \
RRA:MAX:0.5:6:700 \
RRA:MAX:0.5:24:775 \
RRA:MAX:0.5:288:797
fi
if test ! -f $cactidir/rra/localhost_proc_7.rrd; then
$bindir/rrdtool create \
$cactidir/rra/localhost_proc_7.rrd \
--step 300  \
DS:proc:GAUGE:600:0:1000 \
RRA:AVERAGE:0.5:1:600 \
RRA:AVERAGE:0.5:6:700 \
RRA:AVERAGE:0.5:24:775 \
RRA:AVERAGE:0.5:288:797 \
RRA:MAX:0.5:1:600 \
RRA:MAX:0.5:6:700 \
RRA:MAX:0.5:24:775 \
RRA:MAX:0.5:288:797
fi
if test ! -f $cactidir/rra/mysql_stats_38.rrd; then
$bindir/rrdtool create \
$cactidir/rra/mysql_stats_38.rrd \
--step 300  \
DS:questions:COUNTER:600:0:U \
DS:openedTables:COUNTER:600:0:U \
DS:abortedConnects:COUNTER:600:0:U \
DS:connections:COUNTER:600:0:U \
DS:flushCommands:COUNTER:600:0:U \
DS:threadsCreated:COUNTER:600:0:U \
RRA:AVERAGE:0.5:1:600 \
RRA:AVERAGE:0.5:6:700 \
RRA:AVERAGE:0.5:24:775 \
RRA:AVERAGE:0.5:288:797 \
RRA:MAX:0.5:1:600 \
RRA:MAX:0.5:6:700 \
RRA:MAX:0.5:24:775 \
RRA:MAX:0.5:288:797
fi
if test ! -f $cactidir/rra/mysql_innodb_bandwidth_39.rrd; then
$bindir/rrdtool create \
$cactidir/rra/mysql_innodb_bandwidth_39.rrd \
--step 300  \
DS:dataRead:COUNTER:600:0:U \
DS:dataWritten:COUNTER:600:0:U \
DS:osLogWritten:COUNTER:600:0:U \
RRA:AVERAGE:0.5:1:600 \
RRA:AVERAGE:0.5:6:700 \
RRA:AVERAGE:0.5:24:775 \
RRA:AVERAGE:0.5:288:797 \
RRA:MAX:0.5:1:600 \
RRA:MAX:0.5:6:700 \
RRA:MAX:0.5:24:775 \
RRA:MAX:0.5:288:797
fi
if test ! -f $cactidir/rra/mysql_keys_33.rrd; then
$bindir/rrdtool create \
$cactidir/rra/mysql_keys_33.rrd \
--step 300  \
DS:keyBlocksUnused:GAUGE:600:0:U \
DS:keyBlocksUsed:GAUGE:600:0:U \
DS:keyReads:COUNTER:600:0:U \
DS:keyReadRequests:COUNTER:600:0:U \
DS:keyWrites:COUNTER:600:0:U \
DS:keyWriteRequests:COUNTER:600:0:U \
RRA:AVERAGE:0.5:1:600 \
RRA:AVERAGE:0.5:6:700 \
RRA:AVERAGE:0.5:24:775 \
RRA:AVERAGE:0.5:288:797 \
RRA:MAX:0.5:1:600 \
RRA:MAX:0.5:6:700 \
RRA:MAX:0.5:24:775 \
RRA:MAX:0.5:288:797
fi
if test ! -f $cactidir/rra/mysql_qcache_performance_35.rrd; then
$bindir/rrdtool create \
$cactidir/rra/mysql_qcache_performance_35.rrd \
--step 300  \
DS:qcacheInserts:COUNTER:600:0:U \
DS:qcacheHits:COUNTER:600:0:U \
DS:qcacheLowmemPrunes:COUNTER:600:0:U \
DS:qcacheNotCached:COUNTER:600:0:U \
RRA:AVERAGE:0.5:1:600 \
RRA:AVERAGE:0.5:6:700 \
RRA:AVERAGE:0.5:24:775 \
RRA:AVERAGE:0.5:288:797 \
RRA:MAX:0.5:1:600 \
RRA:MAX:0.5:6:700 \
RRA:MAX:0.5:24:775 \
RRA:MAX:0.5:288:797
fi
if test ! -f $cactidir/rra/mysql_qcache_performance_35.rrd; then
$bindir/rrdtool create \
$cactidir/rra/mysql_qcache_performance_35.rrd \
--step 300  \
DS:qcacheInserts:COUNTER:600:0:U \
DS:qcacheHits:COUNTER:600:0:U \
DS:qcacheLowmemPrunes:COUNTER:600:0:U \
DS:qcacheNotCached:COUNTER:600:0:U \
RRA:AVERAGE:0.5:1:600 \
RRA:AVERAGE:0.5:6:700 \
RRA:AVERAGE:0.5:24:775 \
RRA:AVERAGE:0.5:288:797 \
RRA:MAX:0.5:1:600 \
RRA:MAX:0.5:6:700 \
RRA:MAX:0.5:24:775 \
RRA:MAX:0.5:288:797
fi
if test ! -f $cactidir/rra/mysql_tables_34.rrd; then
$bindir/rrdtool create \
$cactidir/rra/mysql_tables_34.rrd \
--step 300  \
DS:openTables:GAUGE:600:0:U \
DS:openedTables:COUNTER:600:0:100 \
DS:createdTmpDiskTable:COUNTER:600:0:100 \
DS:createdTmpTables:COUNTER:600:0:U \
DS:slaveOpenTempTables:GAUGE:600:0:100 \
RRA:AVERAGE:0.5:1:600 \
RRA:AVERAGE:0.5:6:700 \
RRA:AVERAGE:0.5:24:775 \
RRA:AVERAGE:0.5:288:797 \
RRA:MAX:0.5:1:600 \
RRA:MAX:0.5:6:700 \
RRA:MAX:0.5:24:775 \
RRA:MAX:0.5:288:797
fi
if test ! -f $cactidir/rra/webstamp_counts_42.rrd; then
$bindir/rrdtool create \
$cactidir/rra/webstamp_counts_42.rrd \
--step 300  \
DS:userCount:GAUGE:600:0:U \
DS:stampCount:GAUGE:600:0:U \
DS:orderCount:GAUGE:600:0:U \
RRA:AVERAGE:0.5:1:600 \
RRA:AVERAGE:0.5:6:700 \
RRA:AVERAGE:0.5:24:775 \
RRA:AVERAGE:0.5:288:797 \
RRA:MAX:0.5:1:600 \
RRA:MAX:0.5:6:700 \
RRA:MAX:0.5:24:775 \
RRA:MAX:0.5:288:797
fi
if test ! -f $cactidir/rra/webstamp_stats_40.rrd; then
$bindir/rrdtool create \
$cactidir/rra/webstamp_stats_40.rrd \
--step 300  \
DS:stamps:COUNTER:600:0:U \
DS:orders:COUNTER:600:0:U \
DS:users:COUNTER:600:0:U \
RRA:AVERAGE:0.5:1:600 \
RRA:AVERAGE:0.5:6:700 \
RRA:AVERAGE:0.5:24:775 \
RRA:AVERAGE:0.5:288:797 \
RRA:MAX:0.5:1:600 \
RRA:MAX:0.5:6:700 \
RRA:MAX:0.5:24:775 \
RRA:MAX:0.5:288:797
fi
