Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792884227;
	b=rpViKJ1/nnT0h/Mg4eVRCCSa2xrlSHaYnwAYoof5DHkfm96px0io2iaqn5XiS7f4JU0d
	 93olEvGCfnMEq60kzebhtD6YjFCw85qPbLmFFkUc48eExPSLXYuVFQsrCH3vwjFrfDvL0
	 PSDblvmDO+V46fu34NUmTQQCh7uBGola0mU2YKtlYRzT4Z8uTcy6Szh8ACh31aWvL+Gta
	 Ur1B0DtD8kTGCSr0lfrslyj7Lk8kD7/XWpRGfhuwFSMNuJTnhD/KY5Z/eFsD05MCHrot6
	 5YYmKyClLifBNqYFfWPZk06l0YW0sNayB4XpXGHEyA5T3nLi67lSXY8bmvNythcte4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792884227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=nWPXbSRDs8rMboRwm6/LnywXrjQ23JDok0sYLWI/C54=;
	b=o/4+UuOUvJEGFeg6MJOqYOVAzkw7zb/5Zs3DJeigieqk/v+7mPvmJNVEbYrRbwtfwsVm
	 6SGHCMjr2NBbNAxGxBpJ5EjafsyFE/V/wndA0lTTID2BNbKMiGCmbRpgh2iPRzPDV0DnC
	 L6kQyPud+azQtZnz092yBuF8fCH+LyNa+TJRMzRjga19GX5I3MsdBBo/plQdcih2hrRos
	 HWpmf8dXI9wWRHRAPM5Z/7Vjv9C5W4jnJUhYfo+HcuoEP0f+ewCWYrXrQMBV8KVz2RcYB
	 TMLNVMUnteOcXHY1EDeNidvhSk1cVDCqHfpvPP+5CK1qdrB8jrxNO25bdS66PWSyplg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WtG3nKU8;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C54606A31A
	for <sophgo@lists.linux.dev>; Sat, 24 Oct 2026 23:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26C54606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WtG3nKU8
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ab98332238so1059942a91.3
        for <sophgo@lists.linux.dev>; Sat, 24 Oct 2026 16:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792884226; x=1793489026; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nWPXbSRDs8rMboRwm6/LnywXrjQ23JDok0sYLWI/C54=;
        b=WtG3nKU8NdRv+cdY+4U5uDJmJcR15WHNgwx+fxiqMFfYXd535UDwpgyztCWylO/rBJ
         Jep5psBNi6gfltO7FKPSbhKaQ6H2RNl6PqXGQet/3e5XnLJIQOb7mqzT4Wvog59d7Riz
         27gzR6AN8dSMmt0Zx6x/mm0/acl4PzWLaI0G2SHjzjWF99AaMYQmyzwd8y2F3xcjxvDJ
         uXqgBTHzd8l7DTg0nY243MFAuw6jxyJ56KwK7pS4KnT1+8g9ey845i6zIG8sNodnBx4W
         HuxEvfuRb+oRCJUHG3+FNyijAvBSS1Hvs+RSqryDHmqTkx5s3Mh2oT378edLnyhhPQAy
         F/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792884226; x=1793489026;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nWPXbSRDs8rMboRwm6/LnywXrjQ23JDok0sYLWI/C54=;
        b=bDr3iVOfDKLxWiYZJ1YnCHBnhk/GXaIadS8LGLwg/uxKA9Tz2Dn4RokKgnAUo7R68A
         WG1Fp5YhJ2tn0bChtXCW/nx86fDyEEhNBk4mjTx+oIXyxx3EeQsJ8hfYnEHcK/Kd/0P7
         tFZwArfiGs9FJDw48dFmFOueyr6RYsUz4OomljYOeFpzKhFyzoRODM1EzYHZM0OjnJnf
         5HO24di+OUHgtyamsXuWBANEXjxZPHw6toq76V/Qikt75138Z+wLY9CXzYqQHGs1audS
         0grgVYaiMoLiWVuMK2EP/RAKWjMyew87f7Oyingkiz0PgZPyq3mxFoc4hlz4pDNUQ9S3
         v8kg==
X-Forwarded-Encrypted: i=1; AKwUvByxZI3I1FV1RYl7jqHK4DaxbULeDsJ/eKC7eSjxn8vAKzwJUI6EYhwojyiRVaA6giJ9oegZXYQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYLaZrqNTXbIi40h11spJZYMUxdnuqfK9cmle/SZ2UMym+M5u4k6
	zR9cYdOirmgQWSvto+Ion5irt9f2zQGZI/x420oF4p/58gBuHEPaEulU
X-Gm-Gg: AYBFou3c5HKMRM2/11oInx2Ul1nOVaWoVV5mdgnJVlsLAiefRuyAeGAc4JjY3i9nsyl
	dKSAFfUxC0qmpn9xnp2Yp0srLBs1F2nM7lw6tnETd6l4ctKxB4P5vAUKbEsvQKKSs2zfjqATWZV
	o1sd2p59kgDdPZDQrHTjmcflla2L3e5sEKXai2Rap3LS4QdAXsqmBySoigPnA8q7tRFaoD5YXK3
	erHgSAEeCfyu1jLEE/4F9XN7jt+R3LXrGIwXgwxAVVZ6IPn/fPKrjsRMkB1yDslAUiZsyQ4ep08
	+qY7ZM+9tLbHTh79FzSbVu3yyqtw0b3+zGI7QZxKGNMUWi/QJ1bk4fTku+INrSm+NzUYHBkv3CW
	TeRqAiJIpo29LTv/pY1E9vlUuaYzyoiq8myYjYPc4V39KSl04cRUbbxuHXsylDFp2cQloW+VuCV
	BgdC2JGOpTgbkGH4DhEa73JpBmVA7oKIilXaWkMi6Lig2Hy0JbJO95JOl3aUpnIWtgazjN0BusY
	8O9XpLNRU7FxOi8BGfQ9obOFeKJNW9DyF12BJGe4CS2h5Pt05lT7A==
X-Received: by 2002:a17:90b:1b01:b0:3ab:1b1c:8a70 with SMTP id 98e67ed59e1d1-3adeafbb11bmr2709298a91.38.1792884226339;
        Sat, 24 Oct 2026 16:23:46 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfeb1sm3779028a91.9.2026.10.24.16.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 16:23:46 -0700 (PDT)
Date: Sun, 25 Oct 2026 07:23:03 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, Chen Wang <chen.wang@linux.dev>, 
	Hiago De Franco <hfranco@baylibre.com>, sophgo@lists.linux.dev
Subject: Re: Milk-V Duo 256M: USB peripheral mode works on mainline, how
 should dr_mode be handled?
Message-ID: <at09avHegBuX6Evc@inochi.infowork>
References: <20261024150531.939657-1-chenyou910331@gmail.com>
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261024150531.939657-1-chenyou910331@gmail.com>

On Sat, Oct 24, 2026 at 11:05:31PM +0800, Chen-Yu Yeh wrote:
> Hi Inochi, Chen,
> 
> I tested the USB port of the Milk-V Duo 256M (SG2002) in peripheral
> mode on mainline and it works. Before sending a patch I would like to
> ask which way you prefer, since it touches the board's default.
> 

In fact, neither is prefered, the right way to use dual-role switch,
but it seems like broken. If you want to fix this, feel free to do
that. If not, ship the dts with the behavior from vendor.

Regards,
Inochi

> What I tested (v7.3-rc5, CONFIG_USB_DWC2_DUAL_ROLE=y, g_ether built in),
> with only this change on top of sg2002-milkv-duo256m.dtb:
> 
>   &usb {
>   	dr_mode = "peripheral";
>   };
> 
> the bare board, plugged into a PC through its USB-C port, enumerates at
> high speed:
> 
>   usb 3-9: new high-speed USB device number 53 using xhci_hcd
>   usb 3-9: Product: RNDIS/Ethernet Gadget
>   cdc_ether 3-9:1.0 usb0: register 'cdc_ether' at usb-0000:00:14.0-9, CDC Ethernet Device, 12:ca:4b:aa:b9:31
> 
> ping and ssh work over it, and iperf3 gives about 111 Mbit/s from the
> PC to the board and 88 Mbit/s from the board to the PC. No PHY changes
> were needed; the ID override in the top syscon can stay as it is.
> 
> Today all CV18xx boards set dr_mode = "host". On the Duo 256M, though,
> the USB-C port is the board's only USB connector, and the vendor image
> uses it in device mode by default (USB networking, which is how most
> users first log in). Host mode is needed mainly with the USB & Ethernet
> IO board, whose USB hub hangs off the same controller.
> 
> I see two options:
> 
>  A) Keep "host" as the default and add a separate overlay that switches
>     the port to peripheral mode, like the ethernet one.
> 
>  B) Make "peripheral" the default for the bare board, and have the
>     existing IO board overlay (sg2002-milkv-duo256m-eth.dtso) set
>     dr_mode = "host", since that board is what needs host mode.
> 
> B matches how the hardware is normally used, but it changes the
> default for anyone using the bare board as a host today, for example
> through an OTG adapter. A is the conservative choice.
> 
> Which one would you prefer? I'm happy to send either, and to do the
> same for the other Duo boards if you want them kept consistent
> (Hiago, I've added you since the Duo overlay would be affected the
> same way).
> 
> Thanks,
> Chen-Yu
