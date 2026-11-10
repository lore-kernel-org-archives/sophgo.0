Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294420;
	b=5jy9nVEvhHYpDylPHaTqC9x1WMryPahdJGsIw5bkt/4q1bODaMtsipLegh5sdagQKjVI
	 pGMuXI/uoEGDyEf3FwkVX3XC4cKnEUUy92PHIC+Ib0pAIHo92d7i9fTwfkxeP7D9H1r8v
	 P6Bp47Cig3gqnQD+GV4vZeY7NX2mUOqGa39h/fFItnoe/7ac5u/sBcdlV8mTncT225nMO
	 LEHDnfxEVvrXy3JbeKIPSe6kZAb2lSUunaF6aXubQ1tB3sG1ikaIuXQqVsTu8hQEDMXOX
	 x5/1Fuyfxu3oObeZjXnHqHDU4d/GjTqoROtFCJvgfffXaoUaMXtt8umvomT4UH+qRxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SkuuZSEDVNHqi2MBZkKa5e63wBL2AMVSTh4uSF9XF7s=;
	b=oY89ItEt6xyWWWmPO+hkS/BVx+m0/YbDxmbsqtco8Fnhf59KecICZ6EgE33xWcmeNIiz
	 iMvxfzuZYhUScwXr/LNS4dKk83Kray+L21eB8ggmOYnd/2A72tx7TCAgJ+YFpW4EX8kjq
	 IYM1l/o4eWQXA5imNLFeZEOr1HkBTBPMZAQDEMNHa7moQNBOks6RPQonPre+/CiLWw0As
	 wmbU3zdKg6eAVJ8BnydkzFhrAOa6kgtHZQLLoJFsLwqaMfSybVcMMYfqf9Q5TBylLk1AC
	 z3MbTaLZCWg6xMUb97EJuJy42RJGsNjjQXemrJdlKL3QKhZFxSz1AGqJjGPcY81P4UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P2ufLybj;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D734360A2600
	for <sophgo@lists.linux.dev>; Tue, 10 Nov 2026 07:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D734360A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P2ufLybj
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a9f9473029so1374085b3a.2
        for <sophgo@lists.linux.dev>; Mon, 09 Nov 2026 23:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794294419; x=1794899219; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SkuuZSEDVNHqi2MBZkKa5e63wBL2AMVSTh4uSF9XF7s=;
        b=P2ufLybjEcrZY45azP44cWKVTmMPsIFICX0Gn+ow6K2OdV/61HpoA1lkoZKk08omD+
         47Hn5pHXHbjGCdlZD5lvA4I9FuoOSw5190aH8VYmwFeH46GC7SFlJEDIY3GkwzDZt12H
         fiHYSaTIaIELDNbL+LxVfeQPt9kNS7vp6uCOqVcfhCIsbyBEcEdmDwXV4D+Z+bVWXew6
         Edmi3c91fPSymy3yxnstM2yxqf3q7vLvNa9UAUcFeFdmG6NlAJBVv+3Ed/mUYwx88l7H
         KEplqpaKf+IhOuifSjUJb6d7rDC58bhSr+dD2UfqzLSfXDskrVXuJGRTKikbMdYL+5hy
         9K6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294419; x=1794899219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SkuuZSEDVNHqi2MBZkKa5e63wBL2AMVSTh4uSF9XF7s=;
        b=GZmXb5SskDCKqrfRZ2D2zjqdltLsMkukqrLTSCWlkkK62+SaPKSChmARXNiq15odSN
         ZODi+WdPXet9W2358dWUJcQo7JCG85rXtuu2Tzs4OaoJvn5JP1yoMsZbI716m1HRSQ6J
         dUv98WL0Sa0FvyfWfUjKOqIMD2lUKpKH64pFGLcBmOeCHoOJMCWfID0DbXE7plwRX5WB
         BuMMXbz47TIfCdApEuwfkzp46qAzBOJjGZjW6elYvK/sXOh3B772UuDlDtJhW1heodI7
         yMsFM5VRO41jAIBl1+crEotW302evd6LN1TL46/2Wvuk7XaUhzo6tWxp9w/Esf9yzwxy
         XkbQ==
X-Forwarded-Encrypted: i=1; AL+hErFD0gdVWpVnmGox6jkDfAK15aFEWl09s+DZK0PL3Bt/AguXJkZeH8KUbLPj4vE8OtXVy4Oilkk=@lists.linux.dev
X-Gm-Message-State: APuU4Z9n7beMUWSEHJ09esofUAGMH5ScMxbAbGI3L0DdAJM1PXQx5esW
	PN6ID8eVnVxzTyBfp8FDLPIRF1qwiT6xMYNQu63MpoGXzol3PbvLilh6
X-Gm-Gg: AYBFou3LWl/53zEH7H+og4xpr5SBIe0riOGXdUB5+bwvEzXKCUEImlsMecxaqW34MFV
	I9sUV1Xan22nCT0PRVU9sHJy7fQcBjeUd9PgZdm/M3FZjzTA/zbxvFsD/S3QABvY0uM2UwaGl7C
	k91ey7sNSQwWP22WXOPzyOEC0Q9pOBePkjIwkoVXRVKXNhzGVaCuHW3pQkwkBNiak+NDOYGb+H0
	/aDicQi5i3T9PopDhuij+7w+DRjEkY9nQqzUH0s6PGb9iebMU5klXoHAl40FWGhfM9auW5Sxabc
	SBGgfN9Txw/sN+wMC/HGBnKJW/Ppeyo4hZYepgyjHURRS5NVA8XQfhuvQKIEC/pRwoxouaEYnQ0
	fy5/n2cGf5q2uqy5hMk/+jh22HK6DCtVAoVdNV1SySuU/zVuluBkTgPfBg/ExbWuKtn7qH9vAEw
	jtlzr6sDv1q5sEO1cmiB4dnSYUt/GCOYnq8VSZQWwsYD6yYVrCNynIK3SUR9Z41jVJCz/ycwdY0
	Wp499elwldQulBZlgSwUpYxmxCr+pMy1blzesSrazUHlgxaFB5m7c7Jc4Vjrx8fPOZYViPlJfjB
	Y4BGdqApyfzypiYqCYoCBYCh7dY=
X-Received: by 2002:a05:6a00:a85:b0:8b6:12fd:7285 with SMTP id d2e1a72fcca58-8ba83bd70ddmr2045184b3a.2.1794294419027;
        Mon, 09 Nov 2026 23:06:59 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab8dffb5sm498961b3a.55.2026.11.09.23.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:06:58 -0800 (PST)
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
Subject: [PATCH 3/4] usb: dwc2: Add USB DRD support on CV1800 series SoC
Date: Tue, 10 Nov 2026 15:06:24 +0800
Message-ID: <20261110070627.217946-4-inochiama@gmail.com>
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

On CV1800 series SoC, it has a problem that it enters the role switch
with a persistent Session End Detected interrupt. As a result, GOTGINT
bit 2 remains set after write-one-to-clear accesses and prevents a
normal boot.

Keeping the BVALID override asserted in host mode avoids the observed
interrupt storm while allowing host enumeration and device operation.
As the BVALOVAL field is device only in the datasheet, this change is
added as a quirk.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/usb/dwc2/core.h   |  3 +++
 drivers/usb/dwc2/drd.c    | 29 +++++++++++++++++++++--------
 drivers/usb/dwc2/params.c |  1 +
 3 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 298b418e6859..52ac64f67f41 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -357,6 +357,8 @@ enum dwc2_ep0_state {
  *                      case.
  *                      0 - No (default)
  *                      1 - Yes
+ * @force_bvalid_in_host: Set the BVALID override value to 1 in host mode to
+ *                       avoid persistent Session End Detected interrupts.
  * @power_down:         Specifies whether the controller support power_down.
  *			If power_down is enabled, the controller will enter
  *			power_down in both peripheral and host mode when
@@ -460,6 +462,7 @@ struct dwc2_core_params {
 	bool reload_ctl;
 	bool uframe_sched;
 	bool external_id_pin_ctl;
+	bool force_bvalid_in_host;
 
 	int power_down;
 #define DWC2_POWER_DOWN_PARAM_NONE		0
diff --git a/drivers/usb/dwc2/drd.c b/drivers/usb/dwc2/drd.c
index 1ad3804cbc80..4f7441a87c85 100644
--- a/drivers/usb/dwc2/drd.c
+++ b/drivers/usb/dwc2/drd.c
@@ -28,10 +28,13 @@ static void dwc2_ovr_init(struct dwc2_hsotg *hsotg)
 	gotgctl = dwc2_readl(hsotg, GOTGCTL);
 	dwc2_ovr_gotgctl(gotgctl);
 	gotgctl &= ~(GOTGCTL_BVALOVAL | GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL);
-	if (hsotg->role_sw_default_mode == USB_DR_MODE_HOST)
+	if (hsotg->role_sw_default_mode == USB_DR_MODE_HOST) {
 		gotgctl |= GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL;
-	else if (hsotg->role_sw_default_mode == USB_DR_MODE_PERIPHERAL)
+		if (hsotg->params.force_bvalid_in_host)
+			gotgctl |= GOTGCTL_BVALOVAL;
+	} else if (hsotg->role_sw_default_mode == USB_DR_MODE_PERIPHERAL) {
 		gotgctl |= GOTGCTL_BVALOVAL | GOTGCTL_VBVALOVAL;
+	}
 	dwc2_writel(hsotg, gotgctl, GOTGCTL);
 
 	spin_unlock_irqrestore(&hsotg->lock, flags);
@@ -45,18 +48,26 @@ static int dwc2_ovr_avalid(struct dwc2_hsotg *hsotg, bool valid)
 	u32 gotgctl = dwc2_readl(hsotg, GOTGCTL);
 
 	/* Check if A-Session is already in the right state */
-	if ((valid && (gotgctl & GOTGCTL_ASESVLD)) ||
+	if ((valid && (gotgctl & GOTGCTL_ASESVLD) &&
+	     (!hsotg->params.force_bvalid_in_host ||
+	      (dwc2_is_host_mode(hsotg) && (gotgctl & GOTGCTL_BVALOVAL) &&
+	       (gotgctl & GOTGCTL_AVALOVAL)))) ||
 	    (!valid && !(gotgctl & GOTGCTL_ASESVLD)))
 		return -EALREADY;
 
 	/* Always enable overrides to handle the resume case */
 	dwc2_ovr_gotgctl(gotgctl);
 
-	gotgctl &= ~GOTGCTL_BVALOVAL;
-	if (valid)
+	if (valid) {
 		gotgctl |= GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL;
-	else
-		gotgctl &= ~(GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL);
+		if (hsotg->params.force_bvalid_in_host)
+			gotgctl |= GOTGCTL_BVALOVAL;
+		else
+			gotgctl &= ~GOTGCTL_BVALOVAL;
+	} else {
+		gotgctl &= ~(GOTGCTL_BVALOVAL | GOTGCTL_AVALOVAL |
+			     GOTGCTL_VBVALOVAL);
+	}
 	dwc2_writel(hsotg, gotgctl, GOTGCTL);
 
 	return 0;
@@ -67,7 +78,9 @@ static int dwc2_ovr_bvalid(struct dwc2_hsotg *hsotg, bool valid)
 	u32 gotgctl = dwc2_readl(hsotg, GOTGCTL);
 
 	/* Check if B-Session is already in the right state */
-	if ((valid && (gotgctl & GOTGCTL_BSESVLD)) ||
+	if ((valid && (gotgctl & GOTGCTL_BSESVLD) &&
+	     (!hsotg->params.force_bvalid_in_host ||
+	      (dwc2_is_device_mode(hsotg) && !(gotgctl & GOTGCTL_AVALOVAL)))) ||
 	    (!valid && !(gotgctl & GOTGCTL_BSESVLD)))
 		return -EALREADY;
 
diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 091bfcfef753..16db9c3c1991 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -222,6 +222,7 @@ static void dwc2_set_cv1800_params(struct dwc2_hsotg *hsotg)
 {
 	struct dwc2_core_params *p = &hsotg->params;
 
+	p->force_bvalid_in_host = true;
 	p->otg_caps.hnp_support = false;
 	p->otg_caps.srp_support = false;
 	p->host_dma = false;
-- 
2.56.0

