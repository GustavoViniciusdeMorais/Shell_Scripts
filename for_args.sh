#!/bin/bash
function list()
{
    for val in $@; do echo $val; done;
}
list $@;
