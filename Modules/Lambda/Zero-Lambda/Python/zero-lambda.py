def handler(event, context):
    message = 'Hello Wolrd!'  
    print("Event {} Context {}".format(event, context))
    return { 
        'message' : message
    }  