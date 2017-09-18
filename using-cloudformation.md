# Using Cloud Formation

For a list of possible actions see:

    aws cloudformation help
    
And for full details for each action, see:

    aws cloudformation <action> help
    
## Validate a JSON template
    aws cloudformation validate-template --template-body file://template.json
    
## List all active stacks
    aws cloudformation describe-stacks
    
## Create a stack
    aws cloudformation create-stack --template-body file://template.json --stack-name MyStackName \
        --parameters file://params.json
_(see events to view progress)_
    
## View stack events
    aws cloudformation describe-stack-events --stack-name MyStackName --max-items <n>
_(lists latest <n> events first, such as start up/shut down)_

## View stack resources
    aws cloudformation describe-stack-resources --stack-name MyStackName
_(e.g. can find EC2 instance ids)_

## Shutdown a stack
    aws cloudformation delete-stack --stack-name MyStackName
_(see events to view progress, by default resources are terminated)_ 