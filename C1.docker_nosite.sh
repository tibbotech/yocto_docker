
# do not use custom folders for SSTATE, TMPDIR
# use ${BUILDDIR} instead

sed -ie 's/^SSTATE_/#SSTATE_/' ${BBPATH}/conf/site.conf
sed -ie 's/^TMPDIR/#TMPDIR/' ${BBPATH}/conf/site.conf
