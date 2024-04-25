from hera.workflows import Steps, Workflow, WorkflowsService, script


@script()
def echo(message: str):
    print(message)


with Workflow(
    generate_name="hello-world-",
    entrypoint="steps",
    namespace="default",
    workflows_service=WorkflowsService(host="http://localhost:8082/argo/"),
) as w:
    with Steps(name="steps"):
        echo(arguments={"message": "Hello world!"})

w.create()
