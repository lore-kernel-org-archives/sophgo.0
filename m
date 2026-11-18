Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001795;
	b=WlJiFKv/3g3ae8PIEXCpXUusj1Lfll0a4Hm0EWckxYamHMkQ9KhvzrTaPo2laSfyvbRF
	 kA9hK11o86bf7R+NB9ZKUlFX7yo40qGq42+gm1eljabRCHgterN1gpLxny/kPbqjGrsGq
	 9yj0EOn6HGGWhp578Drz7ejH83whfRXewLUWCQpHax9xS4rP5dwWkcL6fww84M72hQmqC
	 3dlyvtjyFbWJkuJEQOXRI9lmXILSZBUk7mN1Cway+8lRvNDzpAC8gx5x+tvGA+88oiV5v
	 SuVy6O1m4zwcIuNvt01/LcZhA8OA5ImY02FrNjfDLhVpWRtw1cl0hucy4WmZ9QRXlrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001795;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EohF+oRx/8zwt+ylfzEGCIcRitUdjLX/99U3WEU8q48=;
	b=dKp81FY7BQdfexMRwq11i11n/47cWoyWREsaQ0+qj3bA4zSTgHyCoBYE51vDnqV4kVeh
	 74fp3cVk87eE+uEF6WX2dHFFjinKCOUG0Kh0p33uDjD2E46pNw8kgK3xt8l7HOewd2lV7
	 YcpMH+KSMxw37qGljjbRtAcEzPOW93U6kFd64hUD6/5Avgo3TKs95MlMjJGK0+dhh4ow0
	 BT4U30qf9HpygSY6PxIsEUIaNnHpDGWjftLuIFyNHMRzhxWU9Zy4RajWdfWrKlwS15gtJ
	 Ff2kri90rQL0yz5VUWwiPkF1QjkR7cnqY/DjLvenS77JMieNWZ0Jz5TpLra7rnp7PcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0BU0k1Xm;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C4D606A32A
	for <sophgo@lists.linux.dev>; Wed, 18 Nov 2026 11:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60C4D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0BU0k1Xm
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdba1bbde0bso407246a12.2
        for <sophgo@lists.linux.dev>; Wed, 18 Nov 2026 03:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795001795; x=1795606595; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EohF+oRx/8zwt+ylfzEGCIcRitUdjLX/99U3WEU8q48=;
        b=0BU0k1XmAzo4m2RtOr7HM/24saTv4OfSpqxyx2DN0ExnjDY8PwKT1Is5LlCkRvxR/8
         FnqbliwfAk/89lIl7h3e/qrTTAq37ciOX9ispOSzOoliXgmXG9kf4ot8Bu0V7Mo58Bbu
         ZPGK/Qxj98PRIOV/BCFnk1Wx2nhX7YvSDsCJYnEcSS5gv7oIJqdoWsgq3bg7re5kvXgq
         tPMpjfn15a4oN5TIZcaCLbPP5SZR3DWit8vFjfKSbQvvZoVAjGEk9gPqH7Chj6TOF3nF
         weSa3NlCPL02CP5KGc1gpnHwXTndfICwcuFLopDrkkbOdhrxcAIOMWt50yj/SOYE5USo
         un+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001795; x=1795606595;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EohF+oRx/8zwt+ylfzEGCIcRitUdjLX/99U3WEU8q48=;
        b=lBtpYYmHKvLAn7djaBoyGLqayY3ed4h4aIFJ7LAaXl/tcmZuqflYMvVnZExl9NJGmq
         UcLtMuos34V05U0TODs9MPzr7PUAgk4YEO/9l55zKUTEeIBK+b7Rk4eTO4lKK6IAE8+Y
         6Up56eYqaKst03vhsR2qOddcQelHU9wSf8H37AUgWwOR+py61cqyRrTpq6glqWgY4UJi
         93URXIVGLPoEvLf3Rb5qSbOKJMuozNuQxC99vbMjzYXl3UZKXmnuz/af3YOjR8H+3QJB
         wwt+DKyk3724H8Aj6Y3QtKNO+x1M8zuK8P+fmtWJotnkM6iCjDmjEMYIRYWlahFVPfnV
         LGeA==
X-Forwarded-Encrypted: i=1; AL+hErGRV3XJHpfaVCEQcO7dFDEuz4Tsrmzfd173dPOOohOWDWbsdN46PfWOxulXUE7CgwOrVC2A1vk=@lists.linux.dev
X-Gm-Message-State: APuU4Z+YWXlwhJQRT53/yqrfDvXshzHB1W6Y7/Q9rMalxBFcMaC5mf3W
	OUpfq0GgrN7P6NzgoCcLlaOBQP71ssEsxaSwzenZO5HGIi7iLGQ6efVt
X-Gm-Gg: AZFdTZfAnkRe6rs2YZhbh0rNuAVMWK0xtLt8I1iCVyCRv1NHKaCTUtEwv30Lq6DBudl
	h9JOJcVFQ5iLaHZ2d9X7BiPrJ3m+YAEGlJIRL8KghgVhPMrk+NUTa76eoY9GTAKdlMak5sgjhnE
	1RthHJgcmTVt/+zM8aU07w5v4Z96irV9qWi864yKujCjGcRyHyxLwBnDlYBBpKT/BA0dKdfnQ18
	PDv3N7xsavmBhExDGFlOBBXzUbMQUNn2FiRU1Y0HmutxyoN8yzI2QCLjS5tg9U3GH7vcdhIPGPN
	I0MpcafQigN7a769iajgbmIMIYLw2HfJHx/q/XUzcBQsNa+452M4AuKHg39sRdw03uMHnlVlfd6
	hD2gVcGXC4iWidYbSEQ9dqzw6azvA94at77oYTOGKAq/a+GdwFPp+Sj6q81c9DNK9Sa6JBWKE1M
	h4FTHP1lNC/0XLMppJchdE7Pe7MUqWLmXD2mBZUwmS0+ybekur77fMfBO2Va/KHpuWuLsGEqJCt
	L5lgl2YvxUXTOpcCZUZ8/9BZhdt7XWxFvoO4SIOKHjMdByG3LQIuexanP+AqNZN2RH7b9bqwMBd
	VVoqb9lg2dKB7ojXKNyqOmtgaMo=
X-Received: by 2002:a17:90b:4488:b0:3b0:e388:d9da with SMTP id 98e67ed59e1d1-3b3d0761702mr2554146a91.29.1795001794613;
        Wed, 18 Nov 2026 03:36:34 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac254ba6sm8944570a91.4.2026.11.18.03.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:36:34 -0800 (PST)
Date: Wed, 18 Nov 2026 19:36:04 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	chen.wang@linux.dev, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, hminas@synopsys.com, gregkh@linuxfoundation.org, 
	looong.bin@gmail.com, dinguyen@opensource.altera.com, paulz@synopsys.com, balbi@ti.com, 
	dlan@gentoo.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/4] usb: dwc2: Add USB DRD support on CV1800 Series SoC
Message-ID: <av2M-6w1u5mOyqDM@inochi.infowork>
References: <20261110070627.217946-1-inochiama@gmail.com>
 <20261113072305.220610-1-chenyou910331@gmail.com>
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
In-Reply-To: <20261113072305.220610-1-chenyou910331@gmail.com>

On Fri, Nov 13, 2026 at 03:23:05PM +0800, Chen-Yu Yeh wrote:
> On Tue, Nov 10, 2026 at 03:06:21PM +0800, Inochi Amaoto wrote:
> > The current DRD implementation of DRD will cause a interrupt flow on
> > CV1800 Series SoC. It has two reasons:
> > 1. The DRD does not sync the phy mode when change the controller mode,
> >    it is a violation of the DRD as it does not rely on a OTG phy.
> > 2. The CV1800 is entered with a Session End Detected interrupt, but the
> >    DRD code has no change on it, so the controller will enter the
> >    interrupt storm.
> 
> Thanks, fixing this in dwc2 makes sense to me. I am dropping my PHY
> series [1].
> 
> I tested patches 1-3 on a Milk-V Duo 256M (SG2002), on top of
> f66469d9905b, with this on the board DTS:
> 
>   &usb {
>   	dr_mode = "otg";
>   	usb-role-switch;
>   	role-switch-default-mode = "peripheral";
>   	status = "okay";
>   };
> 
> R=/sys/class/usb_role/4340000.usb-role-switch below.
> 
> Bare board on a PC, after booting:
> 
>   # echo device > $R/role
>   # devmem 0x03000048 32
>   0x000003C0
>   # cat /sys/class/udc/*/state
>   configured
> 
>   PC$ lsusb | grep 0525
>   Bus 003 Device 012: ID 0525:a4a2 Netchip Technology, Inc. Linux-USB Ethernet/RNDIS Gadget
> 
>   # echo host > $R/role
>   # devmem 0x04340000 32    (GOTGCTL)
>   0x002C00FC
>   # devmem 0x04340004 32    (GOTGINT)
>   0x00000000
> 
> The interrupt count did not move over one second in host mode, so no
> storm. Switching back to device gave "configured" again, and "none"
> went back to device. I did one host/device round on each of two boots.
> 
> On the USB & Ethernet IO board, with a USB stick plugged in:
> 
>   # echo host > $R/role
>   [  136.556790] hub 1-1:1.0: 4 ports detected
>   [  136.837392] usb 1-1.1: new high-speed USB device number 3 using dwc2
>   [  139.174764]  sda: sda1 sda2 sda3 sda4
> 
>   GINTMSK 0xF300081E, HPRT0 0x00001005
> 
> Tested-by: Chen-Yu Yeh <chenyou910331@gmail.com> # Milk-V Duo 256M
> 
> > Note: This patches set does not resolve all the problems, as
> >       usb_add_hcd() will override the role set by dwc2, but I am not
> >       sure whether it should change skip_phy_initialization of hcd.
> >       So I kept it as it is and users still needs to set the role
> >       in the userspace as "role-switch-default-mode" in devicetree
> >       takes no effect.
> 
> I see the same at boot, and the "set mode" print in the PHY driver
> shows the order:
> 
>   [    1.777738] phy phy-3000000.syscon:phy@48.0: set mode 6
>   [    1.778979] phy phy-3000000.syscon:phy@48.0: set mode 5
>   [    1.779005] phy phy-3000000.syscon:phy@48.0: set mode 1
> 
> That is PHY_MODE_USB_DEVICE from dwc2_drd_init(), then HOST_SS (not
> supported by the PHY) and HOST from usb_add_hcd(). The PHY ends up in
> host (0x03000048 = 0x142) while the controller is still in device mode
> (GINTSTS = 0x04000020). On the bare board the UDC stays "not attached"
> and the PC sees nothing. On the IO board the hub does not show up
> either. So until a role is written, the port does not work in either
> mode. This was the same on all three boots.
> 
> I am happy to test the next versions on the Duo 256M, in both device
> and host mode, and send a Tested-by.
> 

If there are no other bug in this patch. There should be no new
version. The device probe problem is not a very big one. And I have
no idea about these thing. Since my time is tight, you are free to
send the fix for the device mode.

> Once your series is merged, would you like me to send the DTS change
> for the Duo 256M, or would you prefer to do it yourself?
> 
> [1] https://lore.kernel.org/all/avLC68zOj8WKuslb@inochi.infowork/
> 
> Regards,
> Chen-Yu

It depends, if you accept setting this to host, I can add them
at once. (Note: once set, no change will be accepted).

Regards,
Inochi
