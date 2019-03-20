"""Build executable"""

import os

import ezored.constants as const
from ezored.mod import file
from ezored.mod import log
from ezored.mod import runner
from ezored.mod import target


# -----------------------------------------------------------------------------
def run(params={}):
    target_name = params['target_name']
    target_config = target.get_target_config(target_name)

    archs = target_config['archs']
    build_types = target_config['build_types']

    if archs and len(archs) > 0:
        for arch in archs:
            for build_type in build_types:
                log.info('Building for: {0}/{1}...'.format(
                    arch['conan_arch'],
                    build_type
                ))

                # conan build
                build_dir = os.path.join(
                    file.root_dir(),
                    const.DIR_NAME_BUILD,
                    target_name,
                    build_type,
                    arch['conan_arch'],
                    const.DIR_NAME_BUILD_TARGET,
                )

                file.remove_dir(build_dir)
                file.create_dir(build_dir)

                run_args = [
                    'conan',
                    'build',
                    os.path.join(
                        file.root_dir(),
                        const.DIR_NAME_FILES,
                        const.DIR_NAME_FILES_TARGETS,
                        target_name,
                        const.DIR_NAME_FILES_TARGET_CONAN,
                        const.DIR_NAME_FILES_TARGET_CONAN_RECIPE,
                        const.FILE_NAME_FILES_TARGET_CONAN_RECIPE_CONANFILE_PY,
                    ),
                    '--source-folder',
                    os.path.join(
                        file.root_dir(),
                        const.DIR_NAME_FILES,
                        const.DIR_NAME_FILES_TARGETS,
                        target_name,
                        const.DIR_NAME_FILES_TARGET_CMAKE,
                    ),
                    '--build-folder',
                    os.path.join(
                        file.root_dir(),
                        const.DIR_NAME_BUILD,
                        target_name,
                        build_type,
                        arch['conan_arch'],
                        const.DIR_NAME_BUILD_TARGET,
                    ),
                    '--install-folder',
                    os.path.join(
                        file.root_dir(),
                        const.DIR_NAME_BUILD,
                        target_name,
                        build_type,
                        arch['conan_arch'],
                        const.DIR_NAME_BUILD_CONAN,
                    ),
                ]

                runner.run(
                    run_args,
                    build_dir
                )
    else:
        log.error('Arch list for "{0}" is invalid or empty'.format(
            target_name
        ))
