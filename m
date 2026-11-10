Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294408;
	b=cLRoy8CtGJOAnI2jZJrGFTZfcDaHCHRks2ojL4RJ0RJyeC9QIL35T8y5jzotEnZ0vesH
	 fjP6mf+9CjueLgoC08FHfuAo9vWKZHakuW8999RkCxB7GHmesPxxtofpvdrrTNyqZvlZR
	 SHPBQDJ/ZtEpbDMtHPIMPKhAj7kWbkyTp5K+c1sXxz+77kbYSpARBGJo2R08bDlmilEuT
	 fKkJ0PkYQWdfYxfxvzBmWHMil8wxqji4SCEOyt4u0AGeQOtMwd+fTe0fTzHHE6H2dzz28
	 /mPbI3OZDF/ONTCX84S2zsAxHY/PrYhbfRHi/iff8kXMPYtVBaBkYdBha5HLLSVozVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oK7s+kTj8JHO9aImQkcN2MWu+t89MEslq0oYBzkYn0I=;
	b=JOVnumUXGzJqhDO59NAK8Gt4uy0lzlnV/NbuSSTFkTilcJ+J3JrL7t4x34bt9dVMwmCj
	 O3AXlpMclmsfDtnr7AyuoBEhfz0R5poIvRhAt9skq7T5qkBzMWgr/wsG5FzZVNP5Mf4P1
	 Za+jms/0rxezjooh6Ejjjm2FPLmU+smVhFuTbQoz66AEHE1Bs2OEjnRPgrZw1F0lwwGt3
	 U94zE+gFDxek3B9l3pBWYbhD0l16H3SqW6d2vWb6/y3KbciZ0HtcJZQXCr0ZDhSufetgN
	 KNFtSxpjCrrAlAsVHdkaVr0m15SUUyZD76u/ScB/joYxPWhzXbZuO/zqOkF8u0wPMhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q1Lu++0l;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8624A606A326
	for <sophgo@lists.linux.dev>; Tue, 10 Nov 2026 07:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8624A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q1Lu++0l
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so1206691b3a.2
        for <sophgo@lists.linux.dev>; Mon, 09 Nov 2026 23:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794294408; x=1794899208; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oK7s+kTj8JHO9aImQkcN2MWu+t89MEslq0oYBzkYn0I=;
        b=q1Lu++0lUyDs671G2KwG8UKHCTr+gaimDj1GlbICPcB2WNWUN8K/zhRdVGCvXKxV4e
         VVbAkgKfKdjwcmG69mokuQTmiz2e0OSlHY/D1reL5x0xWHODBOcKGkQyRKsGTvBENKuD
         +gle3DGs7uQhD9hAxzgC1Ap1ZDy4pG+C8rThTkfUovO8u20fUWQFc+kxBgFr7mffcveJ
         a41nHtHUj0FBhB9Z1gqOrhXpzUfQTrCpgwGIcnbqijyWkv/GB3fLXYVF+G/QHYOUxj7o
         tT9WTh1BsHKOC7BijC+e+0cqPc0y2SySw7hxcBmz46ah2JE956UvLoNgrThwOnsjDesP
         mRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294408; x=1794899208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oK7s+kTj8JHO9aImQkcN2MWu+t89MEslq0oYBzkYn0I=;
        b=O/mZe3l5i8MnWdRMXXo2KhZr4NReRYXV7WnGue3iD6UOogsG/aCTOxc5Ptg6Il46A4
         TYhEBjp9k4gb5I/b/yy4+z/G6ZYWUj+Um6OuFu6k/AQ7WU15OWuAo49Fwai71uLmZhoP
         y/cXXiajOhZpjo3hMxeeJsExod42HEa8tvCOA5Vo06MmbsqPOimlDIK52EUs21SfOW0e
         VxUPIwE+L57SNh4Y4SQQb3yjZJQKCkoa2c7kd/HUIHWIK/IecFe6QE1M/TMCGUyZ5XNR
         bN8bfZjaY71rQmlwhDAAy4mNM3JfVIcf7ipbZsGGpGV7N6lpOrT0u0TXgzT8C11u24K0
         WIZA==
X-Forwarded-Encrypted: i=1; AL+hErEopCnRNXDv93VZlOO0G+ozADk2MaQPav6j+GadIbH92YBElPtZFZCyIfTFYUzejNgdVzhubXs=@lists.linux.dev
X-Gm-Message-State: APuU4Z99SWwQrBOB5HpOepEK32SAxpt86lUg4mUpXxU56CbyTVvg96sx
	Afjeyp2HPrqeD4mx/yOsvtPt415T8qEWkDPMbbx4hQqf2qc8+eZZoj+f
X-Gm-Gg: AYBFou10dxtorRNaa1TC7U1gkkff2RmWASYkhcwi0iHJevVVSXT8m5UGAJaYiLssRZk
	8NZ66TprmvXtZeOSy3HztO/XHr1HpQt0HJbH5dj3XATDo4QK9xGK8W8MQIUPgyxx+xktrid87nN
	Ejct1pRgViUYz5qf0/NHwytk8smANA4aF/EcSefPP2A75ztH9PYATwZEg/jKE7MovVADyBbelfX
	XkDYOEpDcpBvGFVaIi/BJu0POxNTXNXKbe1dXmGpWxTHaaWnwm6gfg1nLJM57JXYbJe3j3mUe0f
	9ZcGEQ7Nn6dJ+135Nx3sPB4nEJc+c6hBDULA33hbaaLpZJqB87SyTNYZOx6BOOBjioNtIAVMNI9
	Ns5rYDNa8g1i74N2Rk5c9ToTJerQc+hUG9+EVdD8bsjBFPKgk/1pcWUz7+hVki4ydd5Hq+SJqJz
	s7CU4xxpINshkUri30L4WEyaZ8coEibhpHYdperae4p9gmIjbfBciBhG9dClYr4KBPfOIBPAsrF
	z9Eadl72MeKUi5E64fILl8q3Ku6aV3SSHqi+inwDll6eENYMmPYxNrHZTtBzH5oquHehj87oWIa
	pbRGNNNfF4mlXDJmT7Al0BpDtMg=
X-Received: by 2002:a05:6a00:1389:b0:89a:19ae:10e9 with SMTP id d2e1a72fcca58-8ba8725e415mr1910547b3a.38.1794294407637;
        Mon, 09 Nov 2026 23:06:47 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3f3e7sm511794b3a.40.2026.11.09.23.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:06:47 -0800 (PST)
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
Subject: [PATCH 0/4] usb: dwc2: Add USB DRD support on CV1800 Series SoC
Date: Tue, 10 Nov 2026 15:06:21 +0800
Message-ID: <20261110070627.217946-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The current DRD implementation of DRD will cause a interrupt flow on
CV1800 Series SoC. It has two reasons:
1. The DRD does not sync the phy mode when change the controller mode,
   it is a violation of the DRD as it does not rely on a OTG phy.
2. The CV1800 is entered with a Session End Detected interrupt, but the
   DRD code has no change on it, so the controller will enter the
   interrupt storm.

This patch add fixes for these two problem, and I have tested this on
a Huashan PI board (it has a CV1812H SoC).

Note: This patches set does not resolve all the problems, as
      usb_add_hcd() will override the role set by dwc2, but I am not
      sure whether it should change skip_phy_initialization of hcd.
      So I kept it as it is and users still needs to set the role
      in the userspace as "role-switch-default-mode" in devicetree
      takes no effect.

Inochi Amaoto (4):
  usb: dwc2: gadget: honor pullup requests in core_connect
  usb: dwc2: drd: Sync the generic PHY mode with role requests
  usb: dwc2: Add USB DRD support on CV1800 series SoC
  riscv: dts: sophgo: Enable USB role switch on Huashan PI

 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |  4 +-
 drivers/usb/dwc2/core.h                       |  5 +-
 drivers/usb/dwc2/drd.c                        | 77 +++++++++++++++----
 drivers/usb/dwc2/gadget.c                     |  3 +-
 drivers/usb/dwc2/params.c                     |  1 +
 drivers/usb/dwc2/platform.c                   |  4 +-
 6 files changed, 73 insertions(+), 21 deletions(-)

--
2.56.0

