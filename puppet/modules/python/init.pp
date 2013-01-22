class python {
    case $operatingsystem {
        centos: {
            include python::tools::centos
        }
        debian,ubuntu: {
            include python::tools::debian
        }
    }

    include python::virtualenv
}
