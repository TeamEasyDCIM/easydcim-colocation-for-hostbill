<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInitc23c599f91bf5879208d488325961479
{
    public static $prefixLengthsPsr4 = array (
        'M' => 
        array (
            'ModulesGarden\\Servers\\EasyDCIMv2\\App\\' => 37,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'ModulesGarden\\Servers\\EasyDCIMv2\\App\\' => 
        array (
            0 => __DIR__ . '/../..' . '/app',
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInitc23c599f91bf5879208d488325961479::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInitc23c599f91bf5879208d488325961479::$prefixDirsPsr4;

        }, null, ClassLoader::class);
    }
}
