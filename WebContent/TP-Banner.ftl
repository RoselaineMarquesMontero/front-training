<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">
            <#if (title.getData())??>${title.getData()}</#if>
        </h1>
        <p>
            <#if (description.getData())??>${description.getData()}</#if>
        </p>
        <p><a class="btn btn-primary btn-lg" data-senna-off="true" href="${LinkToPage.getFriendlyUrl()}" role="button">
                <#if (buttonLabel.getData())??>
                    ${buttonLabel.getData()}
                </#if> »
            </a>
        </p>
    </div>
</div>

<style>
    .btn-primary {
        color: #fff;

        background-color: <#if (buttonColor.getData())??>$ {
            buttonColor.getData()
        }

        <#else>#d4ab07</#if>border-color: #cfcfd0;
    }

    .jumbotron {
        color: #fff;
        background: url(<#if (image.getData())?? && image.getData() !="">"${image.getData()}"
        </#if>) no-repeat;
    }
</style>