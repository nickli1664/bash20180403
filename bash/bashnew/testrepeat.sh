#!/bin/bash

repeat()
{
    while true
    do
        $@ && return;        
    done
}

repeat2()
{
    while :;                          #这样比repeat快
    do
        $@ && return;        
        #sleep 30;
    done
}

repeat2 ls