import pkg_resources

from subprocess import call


packages = [dist.project_name for dist in pkg_resources.working_set]
call(
    f"pip install --upgrade --no-cache-dir {' '.join(packages)}", shell=True
)
