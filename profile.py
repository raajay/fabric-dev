"""
A profile for setting up development environment of ml-fabric.

Instructions:
    Space holder for parameter descriptions.
"""

import os
from enum import Enum
import geni.portal as portal
import geni.rspec.pg as rspec


def add_host(hostname, request):
    node = request.RawPC(hostname)
    node.disk_image = "urn:publicid:IDN+emulab.net+image+emulab-ops:UBUNTU16-64-STD"
    node.addService(
        rspec.Execute(
            shell="sh",
            command="sudo %s" % (
                os.path.join(SCRIPTS_FOLDER, "setup-disks-cloudlab-wisc.sh"),
            )
        )
    )
    node.addService(
        rspec.Execute(
            shell="sh",
            command="sudo %s" % (
                os.path.join(SCRIPTS_FOLDER, "init-dev.sh"),
            )
        )
    )


SCRIPTS_FOLDER = os.path.join("/local", "repository", "scripts")
request = portal.context.makeRequestRSpec()
add_host("mlfabric-dev", request)
portal.context.printRequestRSpec()
