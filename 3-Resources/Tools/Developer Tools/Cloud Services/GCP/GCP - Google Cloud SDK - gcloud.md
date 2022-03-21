# Google Cloud SDK CLI Notes
## Installation

See [[Google Cloud Setup Notes]],  [[Install gcloud SDK on Windows]] and [[Install gcloud SDK on Ubuntu]].

## Initializing gcloud

Initialize

  ``` cli
  gcloud init
  ```

A browser tab will be opened. Log-in in the correct Google Cloud account to use for gcloud

Agree to allow gcloud to use the following permissions

- View and manage data across Google Cloud Platform services
- View and manage your Google Compute Engine resources
- View and manage you application deployed on Google App Engine

Choose what project and region to use

``` cli
gcloud GROUP | COMMAND
[--account=ACCOUNT]
[--billing-project=BILLING_PROJECT] [--configuration=CONFIGURATION]
[--flags-file=YAML_FILE]
[--flatten=[KEY,…]]
[--format=FORMAT]
[--help] [-h]
[--project=PROJECT_ID]
[--quiet, -q]
[--verbosity=VERBOSITY; default="warning"]
[--version, -v]
[--impersonate-service-account=SERVICE_ACCOUNT_EMAIL]
--log-http]
[--trace-token=TRACE_TOKEN]
[--no-user-output-enabled]
```

## GLOBAL FLAGS

- --account=ACCOUNT
  - Google Cloud Platform user account to use for invocation. Overrides the default core/account property value for this command invocation.

- --billing-project=BILLING_PROJECT
  - The Google Cloud Platform project that will be charged quota for operations performed in gcloud. If you need to operate on one project, but need quota against a different project, you can use this flag to specify the billing project. If both billing/quota_project and --billing-project are specified
  `--billing-project` takes precedence. Run `$ gcloud config set --help` to see more information about billing/quota_project.

- --configuration=CONFIGURATION
  - The configuration to use for this command invocation. For more information on how to use configurations, run: gcloud topic configurations. You can also use the CLOUDSDK_ACTIVE_CONFIG_NAME environment variable to set the equivalent of this flag for a terminal session.
  
- --flags-file=YAML_FILE
  - A YAML or JSON file that specifies a --flag:value dictionary. Useful for specifying complex flag values with special characters that work with any command interpreter. Additionally, each --flags-file arg is replaced by its constituent flags. See $ gcloud topic flags-file for more information.

- --flatten=[KEY,…]
  - Flatten name[] output resource slices in KEY into separate records for each item in each slice. Multiple keys and slices may be specified. This also flattens keys for --format and --filter. For example, --flatten=abc.def flattens abc.def[].ghi references to abc.def.ghi. A resource record containing abc.def[] with N elements will expand to N records in the flattened output. This flag interacts with other flags that are applied in this order: --flatten, --sort-by, --filter, --limit.

- --format=FORMAT
  - Set the format for printing command output resources. The default is a command-specific human-friendly output format. The supported formats are: config, csv, default, diff, disable, flattened, get, json, list, multi, none, object, table, text, value, yaml. For more details run $ gcloud topic formats.

- --help
  - Display detailed help.

- -h
  - Print a summary help and exit.

- --project=PROJECT_ID
  - The Google Cloud Platform project name to use for this invocation. If omitted, then the current project is assumed; the current project can be listed using gcloud config list --format='text(core.project)' and can be set using gcloud config set project PROJECTID. --project and its fallback core/project property play two roles in the invocation. It specifies the project of the resource to operate on. It also specifies the project for API enablement check, quota, and billing. To specify a different project for quota and billing, use --billing-project or billing/quota_project property.

- --quiet, -q
  - Disable all interactive prompts when running gcloud commands. If input is required, defaults will be used, or an error will be raised. Overrides the default core/disable_prompts property value for this command invocation. This is equivalent to setting the environment variable CLOUDSDK_CORE_DISABLE_PROMPTS to 1.

- --verbosity=VERBOSITY; default="warning"
  - Override the default verbosity for this command. Overrides the default core/verbosity property value for this command invocation. VERBOSITY must be one of: debug, info, warning, error, critical, none.

- --version, -v
  - Print version information and exit. This flag is only available at the global level.

OTHER FLAGS

- --impersonate-service-account=SERVICE_ACCOUNT_EMAIL
  - For this gcloud invocation, all API requests will be made as the given service account instead of the currently selected account. This is done without needing to create, download, and activate a key for the account. In order to perform operations as the service account, your currently selected account must have an IAM role that includes the iam.serviceAccounts.getAccessToken permission for the service account. The roles/iam.serviceAccountTokenCreator role has this permission or you may create a custom role. Overrides the default auth/impersonate_service_account property value for this command invocation.

- --log-http
  - Log all HTTP server requests and responses to stderr. Overrides the default core/log_http property value for this command invocation.

- --trace-token=TRACE_TOKEN
  - Token used to route traces of service requests for investigation of issues. Overrides the default core/trace_token property value for this command invocation.
    
- --user-output-enabled
  - Print user intended output to the console. Overrides the default core/user_output_enabled property value for this command invocation. Use --no-user-output-enabled to disable.

***
Links:  [[GCP]] | [[Google Cloud APIs]] | [[Docker]] | [[GCP Services Table]] | [[Google Cloud Setup Notes]]
Source: [Github: ivan/curada/Awesome-GCP](https://github.com/ivan-curada/Awesome-GCP)