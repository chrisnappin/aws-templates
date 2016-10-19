#Using Cloud Formation

##Validate a JSON template
    aws cloudformation validate-template --template-body file://template.json
    
##Create a stack
    aws cloudformation create-stack --template-body file://template.json --stack-name MyStackName
_(see events to view progress)_
    
##View stack events
    aws cloudformation describe-stack-events --stack-name MyStackName
_(lists latest events first, such as start up/shut down)_

##View stack resources
    aws cloudformation describe-stack-resources --stack-name MyStackName
_(e.g. can find EC2 instance ids)_

##Shutdown a stack
    aws cloudformation delete-stack --stack-name MyStackName
_(see events to view progress, by default resources are terminated)_ 