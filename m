Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554610;
	b=JBsLXO/d4MOkPGrJuP0qmDWuUThSP8c1BiVuyCpdFV1KV2iVm7My46HUdktIGWrkexYa
	 vdfIrlSaV/3jNVKPxvOnIdRUwhuSBUWeJfNmPv65fxplus9o7jNuF4QA34+UjVd+k0cQS
	 0PSP4xE7eW1XMSoUI+wIpODzsGHzHqa+zpjQnzmsEkoGMNajjIhEdzrtPazC+YFAtVTht
	 yn/uBxXZ3DWUFvT0f8FQ30ktCE/T2FvaWYQ4jXfW51jiJxpuXKhvTqxalSpgI/ay8FjIi
	 DfW1juec+FkGjhMaMiMKIt0ggPRZtCrVXGbXpeNlW3OWlKbnGGVP7ZS84+uqkCP2CXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VDKHNKMPhCvwPugcpF6BOJrNWHPrkmJauqAcAuvRmCY=;
	b=GMlrwao2i0TNzIDNKrgHRy2D0gASX1mFhGGg34Uor6R+wnMr94O5g63j1SgOx+3wTJDE
	 v5W1sOGMqEmVDqeKhIaiEra0t0lG4lxHo9Fhqp8TkinoVQLOQZG7DTKImHvAcLcJlNGhR
	 6Wq1y2i9vydIHCBHI/7DFeB+rRlNXr1Q52Mh1sf/ZNrm2MLhhUs3GkET2PdDBRzA/i1uB
	 tJM+UmX8ACEyJmv5YJz4pwDCjTmCGuDUEaitc0moTRPOVmbKCU8zJA4h7uqeuKLL5CUiU
	 qlDj/TdMWSvpYna7+M/un1LmO/5b+jG/2kj+ImLpDPNL86VF6niysQmIdOMcOICcc9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="SD+DPb/7";
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13B0606A327
	for <sophgo@lists.linux.dev>; Fri, 13 Nov 2026 07:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D13B0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SD+DPb/7
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b5e147f101so103696b3a.3
        for <sophgo@lists.linux.dev>; Thu, 12 Nov 2026 23:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794554609; x=1795159409; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VDKHNKMPhCvwPugcpF6BOJrNWHPrkmJauqAcAuvRmCY=;
        b=SD+DPb/7wJA8IEBA4c5VCdCUu/xrVeLEG/lGxN2B5LZfkJJmWHXmlz76ZoJtGQs+LH
         juMoGh4w0LxjQxknnnh0WKPNEtdVeqhW42ks9oIopiF8BvvVBIbZCKVqhuE8RGkLaNDY
         r0DeAIpnpFAe6Jszs+sqajz8d75iauMYgAMB3R2nv+BxjXMFytTIltWIdY2ad4gWCNwv
         g5g5hD3U92ZgAZklEOcvvEAzVitHnjyFe2vKtqPB0ejzViQRfgBdAgFnM3rzC++Blhur
         khip+m0G1cbedqEx9vzKH6tW+OY28pBsdpTYrlYPKpJXa/8cQWl1poKQbHZ02V37TFyO
         NqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794554609; x=1795159409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VDKHNKMPhCvwPugcpF6BOJrNWHPrkmJauqAcAuvRmCY=;
        b=sgNWo6sQSsqckVinquJx3WAyCwUvW5dBQGDja+L1Ruur3dLt8WAcNoISbdT7ZWQCYe
         a9VjbYKVgLWXwAzD2MEh293QT7D2MMFkmWAY6Lum2Mz1fElAT5rk2TSRbuzNB0wzAFsW
         CxY3zOd2llE2xjXmMfNGgeFNrTsdNu0jhSMHIboxOuxx4mgIIpO0Kpj7YzlICChLeVM2
         Il09nm1j1IF+K7uL8775fW2u6szacFb8U1sRwYV8HxP0sXjUtZG+Cwa1v0XnMv3nJc5u
         6UNrt7Y7OoyTFRRVPz9EYEHChuKkKciLQI7ttNm4QBzRnlPBMWWgSdPJhujLyqCXKdXL
         UPsg==
X-Forwarded-Encrypted: i=1; AL+hErE+Mue29tcw5LK2wFA309NSkRMferDSJ0V0Xc7aLpEOH3NpB52BGfDj+kLO9bxPIbxoxtHJ1Sk=@lists.linux.dev
X-Gm-Message-State: APuU4Z9gSzQvAUYrYC6C2E8kKtTsd0OBTwI27iZmem+V1Mb8BrYIkB2B
	d3SscWAf4fKfo/HLhz2qXs5YcKXAA1BJRmILiFCJ3QRjPGZmAnWNhCI9
X-Gm-Gg: AYBFou3TspCc4zI23f6rbOiI68z8wVGmb0Q2MzS9BK7K8URinMLMSIcOZJT4cu37kLJ
	ylwbIKIVIsXCZIocI2pu9Yhjp1phPwmVAKRca/Vnf0oq+nuw1wjEmLoZSrjMg73/SrTM0I4qeco
	uSBexileiDnFqvUQs2EF2fFVq/YnMXnIIgXnapAGoeVNuYq6zFsvyVTJjl7/bHMM4RLFckBcN0t
	nTihYIZDVhHUKUio9eqQhJT6mPt4jY1vBF+42cHZaC5R+Od+cHYp0yven+YMBBnG4UdZ0l5puxO
	HDy1GdHpEpvuk30WJ1YMsgcKYTQiCwqLCKdLdAYUXWYJkV0zk+5aHCD8wx4wah72hXRNw2LUQVM
	3zqJYDP3Vmi7lRYVsbUTdNP0miHMfo813PQFvci7nmM5tO7zFJblAGaHyQC5kKcVi98xBz0VP60
	02caOXJhxg1KBvPITnjaNoIyrA9saLSy/TtSAuj3gLiiC6eqEXBQEp9w22ltY78HheaqIlLkWcN
	YIL06BgrN3kgRCXXwqNEG/AmmjMEzqJpJhXEZ7Rwd+H4556/3E9D3zaxt6zcDA+ks7ZKfOUO69L
	LTsp9YMpnyaPzVyEaaRUOlfxPI+kCuiQe1jyBsYRZg8ozIbfwiFLvjqhtKeXoGc8/d4V7YtdYUr
	JGSMQSjg2FShr
X-Received: by 2002:a05:6a00:bc8c:b0:8bd:30c8:e414 with SMTP id d2e1a72fcca58-8beb3458494mr3160450b3a.1.1794554609089;
        Thu, 12 Nov 2026 23:23:29 -0800 (PST)
Received: from chenyou.. ([140.116.78.205])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8becbad7de3sm649518b3a.0.2026.11.12.23.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:23:28 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chen.wang@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	hminas@synopsys.com,
	gregkh@linuxfoundation.org,
	looong.bin@gmail.com,
	dinguyen@opensource.altera.com,
	paulz@synopsys.com,
	balbi@ti.com,
	dlan@gentoo.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: Re: [PATCH 0/4] usb: dwc2: Add USB DRD support on CV1800 Series SoC
Date: Fri, 13 Nov 2026 15:23:05 +0800
Message-ID: <20261113072305.220610-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110070627.217946-1-inochiama@gmail.com>
References: <20261110070627.217946-1-inochiama@gmail.com>
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Nov 10, 2026 at 03:06:21PM +0800, Inochi Amaoto wrote:
> The current DRD implementation of DRD will cause a interrupt flow on
> CV1800 Series SoC. It has two reasons:
> 1. The DRD does not sync the phy mode when change the controller mode,
>    it is a violation of the DRD as it does not rely on a OTG phy.
> 2. The CV1800 is entered with a Session End Detected interrupt, but the
>    DRD code has no change on it, so the controller will enter the
>    interrupt storm.

Thanks, fixing this in dwc2 makes sense to me. I am dropping my PHY
series [1].

I tested patches 1-3 on a Milk-V Duo 256M (SG2002), on top of
f66469d9905b, with this on the board DTS:

  &usb {
  	dr_mode = "otg";
  	usb-role-switch;
  	role-switch-default-mode = "peripheral";
  	status = "okay";
  };

R=/sys/class/usb_role/4340000.usb-role-switch below.

Bare board on a PC, after booting:

  # echo device > $R/role
  # devmem 0x03000048 32
  0x000003C0
  # cat /sys/class/udc/*/state
  configured

  PC$ lsusb | grep 0525
  Bus 003 Device 012: ID 0525:a4a2 Netchip Technology, Inc. Linux-USB Ethernet/RNDIS Gadget

  # echo host > $R/role
  # devmem 0x04340000 32    (GOTGCTL)
  0x002C00FC
  # devmem 0x04340004 32    (GOTGINT)
  0x00000000

The interrupt count did not move over one second in host mode, so no
storm. Switching back to device gave "configured" again, and "none"
went back to device. I did one host/device round on each of two boots.

On the USB & Ethernet IO board, with a USB stick plugged in:

  # echo host > $R/role
  [  136.556790] hub 1-1:1.0: 4 ports detected
  [  136.837392] usb 1-1.1: new high-speed USB device number 3 using dwc2
  [  139.174764]  sda: sda1 sda2 sda3 sda4

  GINTMSK 0xF300081E, HPRT0 0x00001005

Tested-by: Chen-Yu Yeh <chenyou910331@gmail.com> # Milk-V Duo 256M

> Note: This patches set does not resolve all the problems, as
>       usb_add_hcd() will override the role set by dwc2, but I am not
>       sure whether it should change skip_phy_initialization of hcd.
>       So I kept it as it is and users still needs to set the role
>       in the userspace as "role-switch-default-mode" in devicetree
>       takes no effect.

I see the same at boot, and the "set mode" print in the PHY driver
shows the order:

  [    1.777738] phy phy-3000000.syscon:phy@48.0: set mode 6
  [    1.778979] phy phy-3000000.syscon:phy@48.0: set mode 5
  [    1.779005] phy phy-3000000.syscon:phy@48.0: set mode 1

That is PHY_MODE_USB_DEVICE from dwc2_drd_init(), then HOST_SS (not
supported by the PHY) and HOST from usb_add_hcd(). The PHY ends up in
host (0x03000048 = 0x142) while the controller is still in device mode
(GINTSTS = 0x04000020). On the bare board the UDC stays "not attached"
and the PC sees nothing. On the IO board the hub does not show up
either. So until a role is written, the port does not work in either
mode. This was the same on all three boots.

I am happy to test the next versions on the Duo 256M, in both device
and host mode, and send a Tested-by.

Once your series is merged, would you like me to send the DTS change
for the Duo 256M, or would you prefer to do it yourself?

[1] https://lore.kernel.org/all/avLC68zOj8WKuslb@inochi.infowork/

Regards,
Chen-Yu
