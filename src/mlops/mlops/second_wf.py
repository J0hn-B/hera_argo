from hera.workflows import Steps, Workflow, WorkflowsService, script


@script()
def echo(message: str):
    print(message)


with Workflow(
    name="second-wf",
    entrypoint="steps",
    namespace="argo",
    workflows_service=WorkflowsService(host="http://localhost:8082/argo/")
) as w:
    with Steps(name="steps"):
        echo(arguments={"message": "It works!"})

w.create()