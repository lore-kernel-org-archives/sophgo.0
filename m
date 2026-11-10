Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294423;
	b=NuH7S1wP7k4yAuagkOCcL4GxjICR2xLs5vzil2titN2g7/qpv6PKkPs+eZejO4VwP0kD
	 zd16dJwePbmHbihLaJ8d1CdkYzIFTJmLvu6uIFE57GV1E4c57HU2NUwitFoqWLV5ipz+e
	 TZ8ci4oxmwP3DEpG+gIUaOza48IDCE1Z6t/AWWWrHRMb1SwockMoUMCvVOe1cdsGOJDXY
	 2pbe4lWWSX3wTUOrldI2KAyW75ewst9A8PlLREjZi8KNuKVOfJwwYss+MYjGnnRIrXK9h
	 qkgF4yI+X6z2bh2xErKcaVZ9DDhLglOrdXsRaPloNQfhzPMSWd/xB7IustF2kRnmnSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pcGi4IiEaNQ770jDWGR1vje4TCdM+wZvKI7Z0ggaKDU=;
	b=ynH4XtJTI3o0pdaFJq2JHZ9ftHX8teEr1CL9mNI0+g6k5Qo6ZIW4aVusbjRlmJV/sxwQ
	 xiWi8UJc08068fELeEwHp2ZfANEdkkRJANa0Y/z+l9Yr8voM4rpjewhHmmxXngvT7ZuWK
	 V6hJcvXbeFJgFMjNz5buD1MKfXiWs/SCr90R4dfgUGP4U1UjAN/hDUhb+aXgYqDe6RPVj
	 2XXkLgazSlNwAknoSU7XBPoHyDahZc+o5zhtcle7qYk4qQ/I7r9KKCwvd/Uc4QxIRjSsS
	 Kgfwhnh+P4UbFsA/+q9Q+Q2OoDIPHIMz/5UmLAq2oWgUDooaUO9OX7EH065mblmUyrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b4A+L58h;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B99460A261F
	for <sophgo@lists.linux.dev>; Tue, 10 Nov 2026 07:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B99460A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b4A+L58h
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so668481a12.1
        for <sophgo@lists.linux.dev>; Mon, 09 Nov 2026 23:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794294422; x=1794899222; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pcGi4IiEaNQ770jDWGR1vje4TCdM+wZvKI7Z0ggaKDU=;
        b=b4A+L58hSlNRGTipuxcsb5w0c607/bXGWfqoLnFo2Szv4XkWKub40RE1wd3cTn5GCU
         KT1+VKx8c25sAV2+brL3PudKG7D8YNnLU0JlIX2QZ+A5mbryVYllAYKYUG2MwPQZ47dL
         JzCMWjPd2aaIXKzn6mlWO8n/ROijuVpvWJbkOrBZPr+uCnY1XGaoX6/tiz126mzQAjdU
         ajb6y9NS9lVpBPs9BZMjxu/939bCCu+J2YPtYN3S/qyuB4QJxJ2ntsVrp6eFPZ5YfTBV
         jhJL6l2BT2GtUlt88vgomYQbYJ5bYsNCfFWWng1daIzbje1QrrYrw4ksC0tUwPP0BviX
         4BCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294422; x=1794899222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pcGi4IiEaNQ770jDWGR1vje4TCdM+wZvKI7Z0ggaKDU=;
        b=dde8F5nA0SIIGdL9KT6bE+C/iYl88vcB6fUuYxzAqt+YrF1+hpFPcYj1W24CYTxba3
         wlsTwvRo/K+cGncQSx2MD8WrLeFO03KBy85YbXQ6nyuWPGUQqzP2ebfVzF/bw1VzG9BY
         wYYQmNLsVX+xauooxPqg0a8hEDyvwi8un0aPtvhYgigt7RD9sSPx85Nm+hvGM+ItJgds
         kVTQeRP5gpbwcbOeg5U8GOwmUcqanNVHuiwKjr5QVP+670u+V6SmnfXyU4TvlvsYhn/z
         TGeyHLonUvxnpjhym9sPW2n2kEk+kdLHRNi5KcvOjxfFeNHa/rD4xmIedf4JIprz3B1O
         qK/Q==
X-Forwarded-Encrypted: i=1; AL+hErG4eRQuI6PIDAceN399thZgLbdhnz7TLhMG7+9NKVQsgkrOVe0NclMJ0GxpCDGgjRJdM4wCJCc=@lists.linux.dev
X-Gm-Message-State: APuU4Z+UR4Gv8TFeQeCKLabz2KkGRJd0flSfPeRDdzJDWOvp5kksxaoq
	HYw6RYkR3fDRaF7PasnmK13dTP4qBy/Ntml+YAf2j16dghm1nyTCmVdh
X-Gm-Gg: AYBFou3jGesdkpB8lm3slYABn70kLVylhihSggmHIThz4ZIJ/2/96xbkhaGEZi5L2Nk
	JtMzg3DYKRb+ZZjuCLt/uxDVRkvW1kmk0NS1CP+wA+BvCbzgqLxsnytgrbhS51eTAZb/yZvFJ6o
	o9waxLOl2ZHjQZCFlUm5qhA7Sn8DyZX1Fri9VVZ8plLcN1VLptf6wh6otAswxzkb8lL9WdNH6g5
	UPWHLBZ4kvvC11J6j/NL3tWhOIvSvRQ5JJ5876LvVSHPUshfUUOVPaCYPNsHyQX0xSVNPM4kiu/
	wrVaAPwrZ6uuThurr2DO0S9Llwx67aG/qiCDLm00CL2Bv9ygLWoVgbJcFLkU5/TQ9jtk8cUaCBz
	SRFXS2Kr4lih5tDCpDlWDVTkxYf29YYSFDWQkvG4BBFuAllbm1VXXj4q//KGa06mpNZV4euvPam
	VhKspJSqHmtNqvFs0ghX+GmTP3w6ffNFtgE1Mu0DCu2NZ2ce0eW4zaV7qS8uckRlEjvbtWbT8rI
	CMylsfIxZShsFlgpX0ntdRUumtudrXc4DMaC9ZtyFQRrt/K93gdumgKdZkTn1iFW4V7wLHxokPT
	U/49iQzYaluU6gFYcfeRGaYoE9kBJy1GpE8phOTe68JSsMqE
X-Received: by 2002:a17:90b:5805:b0:3ac:b44c:2d84 with SMTP id 98e67ed59e1d1-3b166c89a3dmr2067491a91.13.1794294421656;
        Mon, 09 Nov 2026 23:07:01 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b167715fd4sm2625930a91.11.2026.11.09.23.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:07:01 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Longbin Li <looong.bin@gmail.com>,
	Dinh Nguyen <dinguyen@opensource.altera.com>,
	Paul Zimmerman <paulz@synopsys.com>,
	Felipe Balbi <balbi@ti.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 4/4] riscv: dts: sophgo: Enable USB role switch on Huashan PI
Date: Tue, 10 Nov 2026 15:06:25 +0800
Message-ID: <20261110070627.217946-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
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

As current the DWC2 support role switch on CV18XX SoCs. Enable it
on Huashan PI.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
index aedf79f47407..bf3d58c355c3 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
@@ -88,6 +88,8 @@ &uart0 {
 };
 
 &usb {
-	dr_mode = "host";
+	dr_mode = "otg";
+	usb-role-switch;
+	role-switch-default-mode = "host";
 	status = "okay";
 };
-- 
2.56.0

