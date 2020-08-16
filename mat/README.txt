Before runnig simulation execute setup.m script.
To run simulation execute main.m script.
Content:
    functions:
        -plant.m - calculates derrivatives for given state and steering:
            *input args:
                t - time (unification with timevariant objects, in this project skip it with [])
                x - column vector of state: [y, y_m, Theta_1, Theta_2]'
                u - steering single scalar
                params - object parameters copied to persistent variable in initializing call of plant
                            after that call plant with 3 args
            * output:
                dx - column vector of derrivatives: [dy, dy_m, dTheta_1, dTheta_2]'
        -u.m - calculates steering signal (in this project as sin(t)):
            *input args:
                t - time
            * output
                u - steering
    scripts:
        -main.m - simulates identification algorithm
