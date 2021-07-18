#!/bin/bash
timestamp=$(date '+%s')

aws logs put-log-events \
        --log-group-name /aws/lambda/seven-cloudwatch-learn-lambda \
        --log-stream-name '2021/07/04/[$LATEST]0eed12aca81e4228a17c4d8b45077981' \
        --sequence-token "49616907310566588545907279229226477707067763844309923762" \
        --log-events "timestamp=${timestamp}000,message='{\"from\":\"filter-event\", \"info\":\"event rule trigger from filter\"}'" \
        --profile beach
