#!/bin/bash
if [ -z "$SIMPL4DIR" ] ; then
   thisdir=$(readlink $0)
   if [ "${thisdir}" != "" ]
   then
      export SIMPL4DIR=$(dirname $(cd `dirname $thisdir`; pwd))
   else
      export SIMPL4DIR=$(dirname $(cd `dirname $0`; pwd))
   fi
   echo "using $SIMPL4DIR"
fi

if [ ! -e "${SIMPL4DIR}/server/felix/config.ini" ] ; then
   echo "Not a simpl4 installation"
   exit 1
fi

if [ $# = 1 ] ; then
   ACTION=$1
else
   ACTION=start
fi


export JETTY_PORT=_JETTYPORT_
export CONTROL_PORT=8070
export START_CONSOLE=false

cd $SIMPL4DIR
export PATH=.:/opt/java/bin:$PATH

case "$ACTION" in
   start)
      echo  "Starting: $SIMPL4DIR"
      cd server
      run.sh >save 2>&1 &
      echo
   ;;
   
   stop)
      echo -n "Stopping: $SIMPL4DIR:"
      PID=`ps ax | grep "org.apache.felix.main.Main" | grep -v grep | grep -v stop | sed 's/[ ]*//' | cut -d" " -f1`
      echo -n $PID
      if [ -n "$PID" ] ; then
         kill -15  $PID
         count=0
         echo "Waiting1 to PID:$PID"
         while kill -0 $PID 2> /dev/null; do
            echo "Waiting2 to PID:$PID"
            (( count += 1 ))
            if [ $count -gt 20 ] ; then
               echo "Waiting3 give up  PID:$PID"
               break
            fi
            sleep 1;
         done;
      fi
      sleep 2
      for i in `ps ax | grep "org.apache.felix.main.Main" | grep -v grep | grep -v stop | sed 's/[ ]*//' | cut -d" " -f1`
      do
         echo -n $i
         kill -9  $i
      done
      echo
   ;;
   
   restart)
      $SIMPL4DIR/bin/start.sh stop
      sleep 1
      $SIMPL4DIR/bin/start.sh start
      exit $?
   ;;
   
   *)
      echo "Usage: $SIMPL4DIR/bin/start.sh {start|stop|restart}"
      exit 1
   ;;
esac
