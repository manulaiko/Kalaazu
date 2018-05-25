var results  = document.getElementById("results");

/**
 * Executes the request and redirects
 * if successfull
 *
 * @param Request request  Request to exectue.
 * @param string  redirect URL to redirecto if success.
 */
function execute(request, redirect) {
    fetch(request, getData()).then(function(response) {
        return response.json()
    }).then(function(json) {
        if (!json.isError) {
            window.location(redirect);
        }

        addResult(json);
    });
}

/**
 * Adds a result to the div.
 *
 * @param object json Result json.
 */
function addResult(json) {
    var c = "is-danger";
    if (!json.isError) {
        c = "is-success";
    }

    var div   = document.createElement('div');
    div.className = "notification "+ c;

    var close = document.createElement('button');
    close.className = "delete";
    close.onclick = deleteResult;

    div.appendChild(close);
    div.appendChild(document.createTextNode(json.message));

    results.appendChild(div);
}

/**
 * Deletes a result.
 */
function deleteResult() {
    this.parentElement.remove()
}