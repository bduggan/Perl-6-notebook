# Perl-6-notebook

[![Build Status](https://travis-ci.org/sumandoc/Perl-6-notebook.svg?branch=master)](https://travis-ci.org/sumandoc/Perl-6-notebook)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Perl 6](https://img.shields.io/badge/Perl%206-2018.01-blue.svg)](https://rakudo.perl6.org/downloads/star/)
[![](https://images.microbadger.com/badges/image/sumdoc/perl-6-notebook.svg)](https://microbadger.com/images/sumdoc/perl-6-notebook "Get your own image badge on microbadger.com")


This is dockerfile for running a docker container  with Perl 6 kernel in jupyter notebook.


# How to run using [Binder](https://mybinder.org/) ?


+ Click here: [![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/sumandoc/Perl-6-notebook/master)
+ Wait a few seconds.
+ Select `New` -> `Perl 6`

And dive into the Perl 6 notebook.

For more details using Binder [see here](https://sumdoc.wordpress.com/2018/01/04/using-perl-6-notebooks-in-binder/).

# How to run this image in your local computer ?

Type `docker run -it -p 8888:8888 sumdoc/perl-6-notebook` in the docker terminal and access it in your browser with
`docker_ip_address:8888`.

There you are running the notebook.

For detailed instructions, [see here](https://sumdoc.wordpress.com/2017/09/06/how-to-run-perl-6-notebook/).

