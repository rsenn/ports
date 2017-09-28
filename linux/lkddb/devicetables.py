#!/usr/bin/python
#:  devicetables.py : device tables template for source scanning and reporting
#
#  Copyright (c) 2000,2001,2007  Giacomo A. Catenazzi <cate@cateee.net>
#  This is free software, see GNU General Public License v2 for details


import lkddb
from lkddb import value, str_value, mask, chars, strings


# device_driver include/linux/device.h
device_driver_fields = (
    "name", "bus", "kobj", "klist_devices", "knode_bus", "owner", "mod_name",
    "mkobj", "probe", "remove", "shutdown", "suspend", "resume")


# PCI , pci_device_id include/linux/mod_devicetable.h drivers/pci/pci.h

pci = lkddb.scanner_array_of_struct("pci", "pci_device_id")
pci.set_fields(
    ("vendor", "device", "subvendor", "subdevice", "class", "class_mask", "driver_data")
)

def pci_printer(dict, dep, filename):
    v0 = value("vendor",    dict)
    v1 = value("device",    dict)
    cl = value("class",     dict)
    if v0 == 0  and  v1 == 0  and  cl == 0:
        return
    v2 = value("subvendor", dict)
    v3 = value("subdevice", dict)
    cm = value("class_mask",dict)

    v0 = str_value(v0, -1, 4)
    v1 = str_value(v1, -1, 4)
    v2 = str_value(v2, -1, 4)
    v3 = str_value(v3, -1, 4)
    cl = str_value(cl, -1, 6).replace("......", "ffffff") ### really needed ?????????
    cm = str_value(cm, -1, 6).replace("......", "ffffff")
    v4 = mask(cl, cm, 6)
    lkddb.lkddb_add("pci '%s %s %s %s %s' %s # %s" %
        (v0, v1, v2, v3, v4, dep, filename) )

pci.set_printer(pci_printer)
lkddb.register_scanner(pci)


# USB , usb_device_id include/linux/mod_devicetable.h drivers/usb/core/driver.c


usb = lkddb.scanner_array_of_struct("usb", "usb_device_id")
usb.set_fields(
  ("match_flags", "idVendor", "idProduct", "bcdDevice_lo", "bcdDevice_hi",
   "bDeviceClass", "bDeviceSubClass", "bDeviceProtocol",
   "bInterfaceClass", "bInterfaceSubClass", "bInterfaceProtocol",
   "driver_info")
)

USB_DEVICE_ID_MATCH_VENDOR       = 0x0001
USB_DEVICE_ID_MATCH_PRODUCT      = 0x0002
USB_DEVICE_ID_MATCH_DEV_LO       = 0x0004
USB_DEVICE_ID_MATCH_DEV_HI       = 0x0008
USB_DEVICE_ID_MATCH_DEV_CLASS    = 0x0010
USB_DEVICE_ID_MATCH_DEV_SUBCLASS = 0x0020
USB_DEVICE_ID_MATCH_DEV_PROTOCOL = 0x0040
USB_DEVICE_ID_MATCH_INT_CLASS    = 0x0080
USB_DEVICE_ID_MATCH_INT_SUBCLASS = 0x0100
USB_DEVICE_ID_MATCH_INT_PROTOCOL = 0x0200

def usb_printer(dict, dep, filename):
    match = value("match_flags", dict)
    if not match:
        return
    v0 = "...." ; v1 = "...."
    v2 = 0
    v3 = 65535
    v4 = ".." ; v5 = ".." ; v6 = ".."
    v7 = ".." ; v8 = ".." ; v9 = ".."
    if match & USB_DEVICE_ID_MATCH_VENDOR:
        v0 = str_value(value("idVendor", dict), -1, 4)
    if match & USB_DEVICE_ID_MATCH_PRODUCT:
        v1 = str_value(value("idProduct", dict), -1, 4)
    if match & USB_DEVICE_ID_MATCH_DEV_LO:
        v2 = str_value(value("bcdDevice_lo", dict), -1, 4)
    if match & USB_DEVICE_ID_MATCH_DEV_HI:
        v3 = str_value(value("bcdDevice_hi", dict), -1, 4)
    if match & USB_DEVICE_ID_MATCH_DEV_CLASS:
        v4 = str_value(value("bDeviceClass", dict), -1, 2)
    if match & USB_DEVICE_ID_MATCH_DEV_SUBCLASS:
        v5 = str_value(value("bDeviceSubClass", dict), -1, 2)
    if match & USB_DEVICE_ID_MATCH_DEV_PROTOCOL:
        v6 = str_value(value("bDeviceProtocol", dict), -1, 2)
    if match & USB_DEVICE_ID_MATCH_INT_CLASS:
        v7 = str_value(value("bInterfaceClass", dict), -1, 2)
    if match & USB_DEVICE_ID_MATCH_INT_SUBCLASS:
        v8 = str_value(value("bInterfaceSubClass", dict), -1, 2)
    if match & USB_DEVICE_ID_MATCH_INT_PROTOCOL:
        v9 = str_value(value("bInterfaceProtocol", dict), -1, 2)
    lkddb.lkddb_add("usb '%s %s %s%s%s %s%s%s ....' %s %s %s # %s" %
        (v0, v1, v4,v5,v6, v7,v8,v9, v2, v3, dep, filename) )

usb.set_printer(usb_printer)
lkddb.register_scanner(usb)


# IEEE1394 ieee1394_device_id include/linux/mod_devicetable.h

ieee1394 = lkddb.scanner_array_of_struct("ieee1394", "ieee1394_device_id")
ieee1394.set_fields(
  ("match_flags", "vendor_id", "model_id", "specifier_id", "version", "driver_data")
)

IEEE1394_MATCH_VENDOR_ID    = 0x0001
IEEE1394_MATCH_MODEL_ID     = 0x0002
IEEE1394_MATCH_SPECIFIER_ID = 0x0004
IEEE1394_MATCH_VERSION      = 0x0008

def ieee1394_printer(dict, dep, filename):
    match = value("match_flags", dict)
    if not match:
        return
    v0 = "......" ; v1 = "......"
    v2 = "......" ; v3 = "......"
    if match & IEEE1394_MATCH_VENDOR_ID:
        v0 = str_value(value("vendor_id", dict), -1, 6)
    if match & IEEE1394_MATCH_MODEL_ID:
        v1 = str_value(value("model_id", dict), -1 , 6)
    if match & IEEE1394_MATCH_SPECIFIER_ID:
        v2 = str_value(value("specifier_id", dict), -1, 6)
    if match & IEEE1394_MATCH_VERSION:
        v3 = str_value(value("version", dict), -1, 6)
    lkddb.lkddb_add( "ieee1394 '%s %s %s %s' %s # %s" %
        (v0, v1, v2, v3, dep, filename) )

ieee1394.set_printer(ieee1394_printer)
lkddb.register_scanner(ieee1394)


# s390 CCW ccw_device_id include/linux/mod_devicetable.h


ccw = lkddb.scanner_array_of_struct("ccw", "ccw_device_id")
ccw.set_fields(
  ("match_flags", "cu_type", "dev_type", "cu_model", "dev_model", "driver_info")
)

CCW_DEVICE_ID_MATCH_CU_TYPE      = 0x01
CCW_DEVICE_ID_MATCH_CU_MODEL     = 0x02
CCW_DEVICE_ID_MATCH_DEVICE_TYPE  = 0x04
CCW_DEVICE_ID_MATCH_DEVICE_MODEL = 0x08

def ccw_printer(dict, dep, filename):
    match = value("match_flags", dict)
    if not match:
        return
    v0 = "...." ; v1 = ".."
    v2 = "...." ; v3 = ".."
    if match & CCW_DEVICE_ID_MATCH_CU_TYPE:
        v0 = str_value(value("cu_type", dict), -1, 4)
    if match & CCW_DEVICE_ID_MATCH_CU_MODEL:
        v1 = str_value(value("cu_model", dict), -1, 2)
    if match & CCW_DEVICE_ID_MATCH_DEVICE_TYPE:
        v2 = str_value(value("dev_type", dict), -1, 4)
    if match & CCW_DEVICE_ID_MATCH_DEVICE_MODEL:
        v3 = str_value(value("dev_model", dict), -1, 2)
    lkddb.lkddb_add("ccw '%s %s %s %s' %s # %s" %
        (v0, v1, v2, v3, dep, filename) )

ccw.set_printer(ccw_printer)
lkddb.register_scanner(ccw)


# s390 AP bus devices ap_device_id include/linux/mod_devicetable.h


ap = lkddb.scanner_array_of_struct("ap", "ap_device_id")
ap.set_fields(
  ("match_flags", "dev_type", "pad1", "pad2", "driver_info")
)

AP_DEVICE_ID_MATCH_DEVICE_TYPE = 0x01

def ap_printer(dict, dep, filename):
    match = value("match_flags", dict)
    if not match:
        return
    if match & AP_DEVICE_ID_MATCH_DEVICE_TYPE:
        v0 = str_value(value("dev_type",   dict), -1, 2)
    else:
        v0 = ".."
    lkddb.lkddb_add("ap '%s' %s # %s" %
        ( v0, dep, filename) )

ap.set_printer(ap_printer)
lkddb.register_scanner(ap)


# ACPI , acpi_device_id include/linux/mod_devicetable.h drivers/acpi/scan.c


acpi = lkddb.scanner_array_of_struct("acpi", "acpi_device_id")
acpi.set_fields(
  ("id", "driver_data")
)

def acpi_printer(dict, dep, filename):
        v0 = strings("id",   dict, '""')
        if v0 == '""':
            return
        lkddb.lkddb_add("acpi %s %s # %s" %
            (v0, dep, filename) )

acpi.set_printer(acpi_printer)
lkddb.register_scanner(acpi)


# PNP #1, pnp_device_id include/linux/mod_devicetable.h


pnp = lkddb.scanner_array_of_struct("pnp", "pnp_device_id")
pnp.set_fields(
  ("id", "driver_data")
)

def pnp_printer(dict, dep, filename):
    v0 = strings("id",   dict, '""')
    if v0 == '""':
        return
    lkddb.lkddb_add("pnp %s %s # %s" %
        (v0, dep, filename) )

pnp.set_printer(pnp_printer)
lkddb.register_scanner(pnp)


# PNP #2, pnp_card_device_id include/linux/mod_devicetable.h drivers/pnp/card.c


pnp_card = lkddb.scanner_array_of_struct("pnp_card", "pnp_card_device_id")
pnp_card.set_fields(
  ("id", "driver_data", "devs")
)

def pnp_card_printer(dict, dep, filename):
    v0 = strings("id",   dict, '""')
    if v0 == '""':
        return
    s = ['""',]*8
    prods = lkddb.nullstring_re.sub('""', dict["devs"])
    line = lkddb.split_structs(prods)[0]
    dict_prod = lkddb.parse_struct(None, lkddb.unwind_array, line, None, filename, ret=True)
    for i in range(8):
        s[i] = strings("n%u"%(i+1), dict_prod, '""')
    lkddb.lkddb_add("pnp_card %s %s %s %s %s %s %s %s %s %s # %s" %
        (v0, s[0], s[1], s[2], s[3], s[4], s[5], s[6], s[7], dep, filename) )

pnp_card.set_printer(pnp_card_printer)
lkddb.register_scanner(pnp_card)


# SERIO , serio_device_id include/linux/mod_devicetable.h drivers/input/serio/serio.c


serio = lkddb.scanner_array_of_struct("serio", "serio_device_id")
serio.set_fields(
 ( "type", "extra", "id", "proto")
)

def serio_printer(dict, dep, filename):
    v0 = value("type", dict)
    v1 = value("proto", dict)
    if v0 == 0  and  v1 == 0:
        return
    v0 = str_value(v0, 0xff, 2)
    v1 = str_value(v1, 0xff, 2)
    v2 = str_value(value("id", dict), 0xff, 2)
    v3 = str_value(value("extra", dict), 0xff, 2)
    lkddb.lkddb_add("serio '%s %s %s %s' %s # %s" %
        (v0, v1, v2, v3, dep, filename) )

serio.set_printer(serio_printer)
lkddb.register_scanner(serio)


# OF , of_device_id include/linux/mod_devicetable.h


of = lkddb.scanner_array_of_struct("of", "of_device_id")
of.set_fields(
  ("name", "type", "compatible", "data")
)

def of_printer(dict, dep, filename):
    v0 = strings("name",   dict, '""')
    v1 = strings("type",   dict, '""')
    v2 = strings("compat", dict, '""')
    if v0 == '""'  and  v1 == '""'  and  v2 == '""':
        return
    lkddb.lkddb_add("of '%s %s %s' %s # %s" %
        (v0, v1, v2, dep, filename) )

of.set_printer(of_printer)
lkddb.register_scanner(of)


# VIO , vio_device_id include/linux/mod_devicetable.h


vio = lkddb.scanner_array_of_struct("vio", "vio_device_id")
vio.set_fields(
  ("type", "compat")
)

def vio_printer(dict, dep, filename):
    v0 = strings("name",   dict, '""')
    v1 = strings("compat", dict, '""')
    if v0 == '""'  and  v1 == '""':
        return
    lkddb.lkddb_add("vio %s %s %s # %s" %
        (v0, v1, dep, filename) )

vio.set_printer(vio_printer)
lkddb.register_scanner(vio)


# PCMCIA , pcmcia_device_id include/linux/mod_devicetable.h drivers/pcmcia/ds.c


pcmcia = lkddb.scanner_array_of_struct("pcmcia", "pcmcia_device_id")
pcmcia.set_fields(
  ("match_flags", "manf_id", "card_id", "func_id", "function",
   "device_no", "prod_id_hash", "prod_id", "driver_info", "cisfile")
)

PCMCIA_DEV_ID_MATCH_MANF_ID   = 0x0001
PCMCIA_DEV_ID_MATCH_CARD_ID   = 0x0002
PCMCIA_DEV_ID_MATCH_FUNC_ID   = 0x0004
PCMCIA_DEV_ID_MATCH_FUNCTION  = 0x0008
PCMCIA_DEV_ID_MATCH_PROD_ID1  = 0x0010
PCMCIA_DEV_ID_MATCH_PROD_ID2  = 0x0020
PCMCIA_DEV_ID_MATCH_PROD_ID3  = 0x0040
PCMCIA_DEV_ID_MATCH_PROD_ID4  = 0x0080
PCMCIA_DEV_ID_MATCH_DEVICE_NO = 0x0100
PCMCIA_DEV_ID_MATCH_FAKE_CIS  = 0x0200
PCMCIA_DEV_ID_MATCH_ANONYMOUS = 0x0400

def pcmcia_printer(dict, dep, filename):
    match = value("match_flags", dict)
    if not match:
        return
    v0 = "...."  ;  v1 = "...."
    v2 = ".."  ;  v3 = ".."  ;  v4 = ".."
    if match & PCMCIA_DEV_ID_MATCH_MANF_ID:
        v0 = str_value(value("manf_id", dict), -1, 4)
    if match & PCMCIA_DEV_ID_MATCH_CARD_ID:
        v1 = str_value(value("card_id", dict), -1, 4)
    if match & PCMCIA_DEV_ID_MATCH_FUNC_ID:
        v2 = str_value(value("func_id", dict), -1, 2)
    if match & PCMCIA_DEV_ID_MATCH_FUNCTION:
        v3 = str_value(value("function", dict), -1, 2)
    if match & PCMCIA_DEV_ID_MATCH_DEVICE_NO:
        v4 = str_value(value("device_no", dict), -1, 2)
    s1 = '""' ; s2 = '""'; s3 = '""' ;  s4 = '""'
    if match & ( PCMCIA_DEV_ID_MATCH_PROD_ID1 | PCMCIA_DEV_ID_MATCH_PROD_ID2 |
                 PCMCIA_DEV_ID_MATCH_PROD_ID3 | PCMCIA_DEV_ID_MATCH_PROD_ID4 ):
        prods = lkddb.nullstring_re.sub('""', dict["prod_id"])
        line = lkddb.split_structs(prods)[0]
        dict_prod = lkddb.parse_struct(None, lkddb.unwind_array, line, None, filename, ret=True)
        if match | PCMCIA_DEV_ID_MATCH_PROD_ID1:
            s1 = strings("n1", dict_prod, '""')
        if match | PCMCIA_DEV_ID_MATCH_PROD_ID2:
            s2 = strings("n2", dict_prod, '""')
        if match | PCMCIA_DEV_ID_MATCH_PROD_ID3:
            s3 = strings("n3", dict_prod, '""')
        if match | PCMCIA_DEV_ID_MATCH_PROD_ID4:
            s4 = strings("n4", dict_prod, '""')
    lkddb.lkddb_add("pcmcia '%s %s %s %s %s' %s %s %s %s %s # %s" %
        (v0, v1, v2, v3, v4, s1, s2, s3, s4, dep, filename) )

pcmcia.set_printer(pcmcia_printer)
lkddb.register_scanner(pcmcia)


# input, input_device_id include/linux/mod_devicetable.h drivers/input/input.c


input = lkddb.scanner_array_of_struct("input", "input_device_id")
input.set_fields(
  ("flags", "bustype", "vendor", "product", "version",
   "evbit", "keybit", "relbit", "absbit", "mscbit", "ledbit", "sndbit", "ffbit", "swbit",
   "driver_info")
)

INPUT_DEVICE_ID_MATCH_BUS     = 1
INPUT_DEVICE_ID_MATCH_VENDOR  = 2
INPUT_DEVICE_ID_MATCH_PRODUCT = 4
INPUT_DEVICE_ID_MATCH_VERSION = 8
INPUT_DEVICE_ID_MATCH_EVBIT   = 0x0010
INPUT_DEVICE_ID_MATCH_KEYBIT  = 0x0020
INPUT_DEVICE_ID_MATCH_RELBIT  = 0x0040
INPUT_DEVICE_ID_MATCH_ABSBIT  = 0x0080
INPUT_DEVICE_ID_MATCH_MSCIT   = 0x0100
INPUT_DEVICE_ID_MATCH_LEDBIT  = 0x0200
INPUT_DEVICE_ID_MATCH_SNDBIT  = 0x0400
INPUT_DEVICE_ID_MATCH_FFBIT   = 0x0800
INPUT_DEVICE_ID_MATCH_SWBIT   = 0x1000

def input_printer(dict, dep, filename):
    match = value("flags", dict)
    if not match:
        return
    v0 = "...."  ;  v1 = "...."
    v2 = "...."  ;  v3 = "...."
    if match & INPUT_DEVICE_ID_MATCH_BUS:
        v0 = str_value(value("bustype", dict), -1, 4)
    if match & INPUT_DEVICE_ID_MATCH_VENDOR:
        v1 = str_value(value("vendor",  dict), -1, 4)
    if match & INPUT_DEVICE_ID_MATCH_PRODUCT:
        v2 = str_value(value("product", dict), -1, 4)
    if match & INPUT_DEVICE_ID_MATCH_VERSION:
        v3 = str_value(value("version", dict), -1, 4)

    b1 = 0xff
    b2 = 0xffff
    b3 = 0xff  ;  b4 = 0xff  ;  b5 = 0xff
    b6 = 0xff  ;  b7 = 0xff  ;  b8 = 0xff
    b9 = 0xff
    if match & INPUT_DEVICE_ID_MATCH_EVBIT:
        b1 = value("evbit",  dict)
    if match & INPUT_DEVICE_ID_MATCH_KEYBIT:
        b2 = value("keybit", dict)
    if match & INPUT_DEVICE_ID_MATCH_RELBIT:
        b3 = value("relbit", dict)
    if match & INPUT_DEVICE_ID_MATCH_ABSBIT:
        b4 = value("absbit", dict)
    if match & INPUT_DEVICE_ID_MATCH_MSCIT:
        b5 = value("mscbit", dict)
    if match & INPUT_DEVICE_ID_MATCH_LEDBIT:
        b6 = value("ledbit", dict)
    if match & INPUT_DEVICE_ID_MATCH_SNDBIT:
        b7 = value("sndbit", dict)
    if match & INPUT_DEVICE_ID_MATCH_FFBIT:
        b8 = value("ffbit",  dict)
    if match & INPUT_DEVICE_ID_MATCH_SWBIT:
        b9 = value("swbit",  dict)
    lkddb.lkddb_add("input '%s %s %s %s' %s %s %s %s %s %s %s %s %s %s # %s" %
        (v0, v1, v2, v3, b1, b2, b3, b4, b5, b6, b7, b8, b9, dep, filename) )

input.set_printer(input_printer)
lkddb.register_scanner(input)


# EISA, input_device_id include/linux/mod_devicetable.h 

eisa = lkddb.scanner_array_of_struct("eisa", "eisa_device_id")
eisa.set_fields(
  ("sig", "driver_data")
)

def eisa_printer(dict, dep, filename):
    v0 = strings("sig", dict, '""')
    if v0 == '""':
        return
    lkddb.lkddb_add("eisa %s %s # %s" %
        (v0, dep, filename) )

eisa.set_printer(eisa_printer)
lkddb.register_scanner(eisa)


# parisc, parisc_device_id include/linux/mod_devicetable.h arch/parisc/kernel/drivers.c


parisc = lkddb.scanner_array_of_struct("parisc", "parisc_device_id")
parisc.set_fields(
  ("class", "vendor", "device", "driver_data")
)

def parisc_printer(dict, dep, filename):
    v3 = value("sversion", dict)
    if v3 == 0:
        return
    v3 = str_value(v3, 0xffffffff, 8)
    v0 = str_value(value("hw_type", dict), 0xff, 2)
    v1 = str_value(value("hversion_rev", dict), 0xff, 2)
    v2 = str_value(value("hversion", dict), 0xffff, 4)
    lkddb.lkddb_add("parisc '%s %s %s %s' %s # %s" %
        (v0, v1, v2, v3, dep, filename) )

parisc.set_printer(parisc_printer)
lkddb.register_scanner(parisc)


# SDIO, sdio_device_id include/linux/mod_devicetable.h drivers/mmc/core/sdio_bus.c 


sdio = lkddb.scanner_array_of_struct("sdio", "sdio_device_id")
sdio.set_fields(
  ("class", "vendor", "device", "driver_data")
)

def sdio_printer(dict, dep, filename):
    v0 = value("class",  dict)
    v1 = value("vendor", dict)
    v2 = value("device", dict)
    if v0 == 0  and  v1 == 0  and  v2 == 0:
        return
    v0 = str_value(v0, -1, 2)
    v1 = str_value(v1, -1, 4)
    v2 = str_value(v2, -1, 4)
    lkddb.lkddb_add("sdio '%s %s %s' %s # %s" %
        (v0, v1, v2, dep, filename) )

sdio.set_printer(sdio_printer)
lkddb.register_scanner(sdio)


# SBB, sdio_device_id include/linux/mod_devicetable.h drivers/ssb/main.c


sbb = lkddb.scanner_array_of_struct("sbb", "ssb_device_id")
sbb.set_fields(
  ("vendor", "coreid", "revision")
)

def sbb_printer(dict, dep, filename):
    v0 = value("vendor",  dict)
    v1 = value("coreid",  dict)
    v2 = value("revision",dict)
    if v0 == 0  and  v1 == 0  and  v2 == 0:
        return
    v0 = str_value(v0, 0xffff, 4)
    v1 = str_value(v1, 0xffff, 4)
    v2 = str_value(v2, 0xff,   2)
    lkddb.lkddb_add("sbb '%s %s %s' %s # %s" %
        (v0, v1, v2, dep, filename) )

sbb.set_printer(sbb_printer)
lkddb.register_scanner(sbb)


# virtio, sdio_device_id include/linux/mod_devicetable.h drivers/virtio/virtio.c

virtio = lkddb.scanner_array_of_struct("virtio", "virtio_device_id")
virtio.set_fields(
  ("device", "vendor")
)

def virtio_printer(dict, dep, filename):
    v0 = value("device", dict)
    v1 = value("vendor", dict)
    if v0 == 0  and  v1 == 0:
        return
    v0 = str_value(v0, -1, 8)
    v1 = str_value(v1, 0xffffffff, 8)
    lkddb.lkddb_add("virtio '%s %s' %s # %s" %
        (v0, v1, dep, filename) )

virtio.set_printer(virtio_printer)
lkddb.register_scanner(virtio)


# I2C , i2c_driver include/linux/i2c.h

i2c = lkddb.scanner_struct("i2c", "i2c_driver")
i2c.set_fields(
  ("id", "class", "attach_adapter", "detach_adapter", "detach_client",
   "probe", "remove", "shutdown", "suspend", "resume", "command",
   "driver", "list")
)

def i2c_printer(dict, dep, filename):
    if not dict.has_key("driver"):
	return
    block = dict["driver"]
    line = lkddb.split_structs(block)[0]
    driver_dict =  lkddb.parse_struct(None, device_driver_fields, line, None, filename, ret=True)
    v0 = strings("name", driver_dict, '""')
    lkddb.lkddb_add("i2c %s %s # %s" % (v0, dep, filename) )

i2c.set_printer(i2c_printer)
lkddb.register_scanner(i2c)


# I2C snd , snd_i2c_device_create sound/i2c/i2c.c

i2c_snd = lkddb.scanner_funct("i2c-snd", "snd_i2c_device_create")
i2c_snd.set_fields(
  ("bus", "name", "addr", "rdevice")
)

def i2c_snd_printer(dict, dep, filename):
    if not dict.has_key("name"):
        return
    v0 = strings("name", dict, '""')
    lkddb.lkddb_add("i2c %s %s # %s" % (v0, dep, filename) )

i2c_snd.set_printer(i2c_snd_printer)
lkddb.register_scanner(i2c_snd)


# "platform" , platform_driver include/linux/platform_device.h

platform = lkddb.scanner_struct("platform", "platform_driver")
platform.set_fields(
   ("probe", "remove", "shutdown", "suspend_late", "resume_early",
   "suspend", "resume", "driver")
)

def platform_printer(dict, dep, filename):
    if not dict.has_key("driver"):
        return
    block = dict["driver"]
    line = lkddb.split_structs(block)[0]
    driver_dict =  lkddb.parse_struct(None, device_driver_fields, line, None, filename, ret=True)
    v0 = strings("name", driver_dict, '""')
    lkddb.lkddb_add("platform %s %s # %s" % (v0, dep, filename) )

platform.set_printer(platform_printer)
lkddb.register_scanner(platform)



# fs , file_system_type include/linux/fs.h


fs = lkddb.scanner_struct("fs", "file_system_type")
fs.set_fields(
  ("name", "fs_flags", "get_sb", "kill_sb", "owner", "next", "fs_supers",
   "s_lock_key", "s_umount_key", "i_lock_key", "i_mutex_key",
   "i_mutex_dir_key", "i_alloc_sem_key")
)

def fs_printer(dict, dep, filename):
    v0 = strings("name", dict, '""')
    lkddb.lkddb_add("fs %s %s # %s" % (v0, dep, filename) )

fs.set_printer(fs_printer)
lkddb.register_scanner(fs)



