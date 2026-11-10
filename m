Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294416;
	b=DRcxjDro92A6qz6w6BjtRmUa9ScejW2IbuCqF/WdIjxVxeXVR1e3CVpE9Wh0ToDe81np
	 poGKCwqscNiJSZBI2Fqw9YhdTbFf+a/O8zoGyg8VhwocXQBrqK2fQSIOAOtw3MScL+TXT
	 vJMvdtmxa6vHSj6cp6mUhASgVN1Xv+TS21eiZdHnqjVJk61XmwerPghKrmBYInVizM9jp
	 QKVf3fTWTimCogsYZ7daZUIjEdvAYa1HHj9gkha6i/6wVpFigOapG2HDlXfg54j2ujVqq
	 7Htnch7VbBO5Cg5GxxKF6iXXfl/BqYyP5ikCm4GwXW+exKLFAjByDO7yr/o8njsBAMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294416;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c6zK+GaiWFIPNNFR8ZSdROw2IY+x8dIA3wZEKaYc0CA=;
	b=mfeU5XNjJpsbJ13laM7A3WCpaFNaCHcDlnOJq4BG3QjJI7AINmGPuulUXuVrvvSCpSLe
	 23ofeM8pttKAXoeF2dWJId+gLEqJNmRfnbxMwaIkFvP+G+uXxKPyqN4cztJU+0tag4ncm
	 uqVx0dPwLEGILDuDHDcE1ov8f+9g6ZzBRh/vCso0FEJWV+yGoxZpwKp735zwgKCjoPw/J
	 tHrcOP8I8M7/ehw0FKx1eBlgnB9dZwm0lJO+nGgY1B+b3L62qG4DA/sjWOt5y8V0hF4LP
	 S0HbCISAl5y5YaRNZSAw0SG/lR/AoFZHvtyz4JRcZKHCT7WlrY7CXezTWMK6/r57Gjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nennEvo4;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C482F606A325
	for <sophgo@lists.linux.dev>; Tue, 10 Nov 2026 07:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C482F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nennEvo4
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdaefe02d5dso1016473a12.1
        for <sophgo@lists.linux.dev>; Mon, 09 Nov 2026 23:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794294415; x=1794899215; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c6zK+GaiWFIPNNFR8ZSdROw2IY+x8dIA3wZEKaYc0CA=;
        b=nennEvo4QHhJJ9rL17+sr/bM4yqEr1g6SvTKHZT+x0QWkREXgj3rfyQIwohOuHvV08
         dpmYJfOgFTrcB0uDWme3gC7UhUDWEwEbmzHb/gI6Z4uU6R02vSFM01MGb7xg93zN7Q8w
         6p5QVqpIhYTGJc2TFe41NRYcT+j2SR93ACs1AqssMSFGtW2Ga2Eho4Z/a0L6qb/TkU5b
         7c/4H76iLZcvgOyzWBjfnOpMMNpEnO2bpgtAPrVg3c2XA3x3F5BzJOnHyIJAyaucosjk
         AEviLEGC+jA0Rdmf/2AniOsLyhDFRO3RpwnbkfwWRTFqiH4ZQS3chcR2sdCHMWV+CmHa
         VgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294415; x=1794899215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c6zK+GaiWFIPNNFR8ZSdROw2IY+x8dIA3wZEKaYc0CA=;
        b=SZ3wkKf68BAXIfGcTPix9S3IjRvFUl70jA/LEy5k1NkGw6xxRdDAk67AyxR25qBjsp
         E+qpQdw6FctDKgP8dS/dSVY0Fvf+r7ei09K1oZAHLgmWkuCg3Rmdx7fKWaPOGlyovUD6
         rv9JPwcdtfnNS4yYyfpum0B9aZReGPj5g43szHBToq63/L5TogIesVxhm+cj+mKGdgf/
         yNhUsLUegwYTN7BkjEip0gXuI+LvcEoqa+akVImqLNGUXH2wSL6bpB9y9YLdbXjbFduT
         Jw+ot/zf13thc1/hu9/jrtLK/p3AdeRLlJ21iwtpIgAB290tKMnGwdTmfkOju5sfXDYb
         R7Kg==
X-Forwarded-Encrypted: i=1; AL+hErFUSU7wlwvBhHLYKEmn1j1yusn9PtcweWfv9idisje4byY4jImMhlOHDZSKvwBisTCVidepIfE=@lists.linux.dev
X-Gm-Message-State: APuU4Z+R9KGEvpypZ77Y8RjrQeuhq3mvKDfOGo+/I61o4RqsR5qoGAkW
	PEwDdGP+DMi3h92vpeO+9HUS52nwOq8wzQVKIUDcGzYiDzmCb5n0ZVWb
X-Gm-Gg: AYBFou2p2XMcNyLnY7pN90O8xbX9CeCRwNk0B9FNXlrf40MguXyCVHqe58qNTGeyvJn
	eOQ4HMKC2zFQy0ncKEPYbsr4RShQMT9pZ3DoCqgs2KNrF38L60iciUB/cxcCPRMKceBIprZFoF2
	/eBBPv0ZpUy3bbfcS4pMgqfzRsWQ+ep6T6YFVyfL9OkcU7K1yDBYI2vsVmzP+zW7FWc99TRgdQd
	/65SF6JWkZ4gLFLFOSE/YM25DrKAZ75XK9FdoYoAj3iMC8UTyIKEzo36YsB2MLL7wyB3+HrnHNA
	z3JNX20WgwB38IeK0yEHVhHACKJ7+uA9l5W5TclyG0Jr2MSp4/Fa8MCwOCkQPjIP04h+Kiwzet/
	s+o/JNMazU4ZnIjaSHgajSXE2KQ5bSlNzVOnAmrz2oEZKHBbYGqRE9OxQ1Rwyk9073CXekUghsN
	/sugVaMKaVMlFd6skyN8w5uf1qDcgiBTisHO6lm1qGJPUJoqnlo6tBIsdzbosG0yg0ss44HzmF1
	iGvgZoPKzuf3LpaHs6aPJZ7I19L+eMvT3G0aWbvhIZ1tFu6/dGYlBt8jH5Mml9p3DrVt4ZZqeiV
	YFwxmNLxyyhGUtuav+czLtdTLk8=
X-Received: by 2002:a17:90b:5101:b0:3b1:12ba:867e with SMTP id 98e67ed59e1d1-3b166c817c9mr2153597a91.13.1794294415185;
        Mon, 09 Nov 2026 23:06:55 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16797069bsm2551932a91.14.2026.11.09.23.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:06:54 -0800 (PST)
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
Subject: [PATCH 2/4] usb: dwc2: drd: Sync the generic PHY mode with role requests
Date: Tue, 10 Nov 2026 15:06:23 +0800
Message-ID: <20261110070627.217946-3-inochiama@gmail.com>
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

The USB DRD does not reply on a OTG phy, which means the controller
should not reply on the switch behavior from PHY. Instead, it should
sync the phy state to avoid a brolen role.

Set the generic PHY mode after resolving the default role and before
updating the controller. And disable the controller clock if there
is a failure and it is disabled.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/usb/dwc2/core.h     |  2 +-
 drivers/usb/dwc2/drd.c      | 48 ++++++++++++++++++++++++++++++-------
 drivers/usb/dwc2/platform.c |  4 +++-
 3 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 015a5fb7842d..298b418e6859 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -1400,7 +1400,7 @@ static inline int dwc2_is_device_mode(struct dwc2_hsotg *hsotg)
 
 int dwc2_drd_init(struct dwc2_hsotg *hsotg);
 void dwc2_drd_suspend(struct dwc2_hsotg *hsotg);
-void dwc2_drd_resume(struct dwc2_hsotg *hsotg);
+int dwc2_drd_resume(struct dwc2_hsotg *hsotg);
 void dwc2_drd_exit(struct dwc2_hsotg *hsotg);
 
 /*
diff --git a/drivers/usb/dwc2/drd.c b/drivers/usb/dwc2/drd.c
index 1ad8fa3f862a..1ad3804cbc80 100644
--- a/drivers/usb/dwc2/drd.c
+++ b/drivers/usb/dwc2/drd.c
@@ -9,6 +9,7 @@
 
 #include <linux/clk.h>
 #include <linux/iopoll.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/usb/role.h>
 #include "core.h"
@@ -88,6 +89,7 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
 	struct dwc2_hsotg *hsotg = usb_role_switch_get_drvdata(sw);
 	unsigned long flags;
 	int already = 0;
+	int ret = 0;
 
 	/* Skip session not in line with dr_mode */
 	if ((role == USB_ROLE_DEVICE && hsotg->dr_mode == USB_DR_MODE_HOST) ||
@@ -111,14 +113,11 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
 	 * mode and sessions. It is the case if cable is plugged at boot.
 	 */
 	if (!hsotg->ll_hw_enabled && hsotg->clk) {
-		int ret = clk_prepare_enable(hsotg->clk);
-
+		ret = clk_prepare_enable(hsotg->clk);
 		if (ret)
 			return ret;
 	}
 
-	spin_lock_irqsave(&hsotg->lock, flags);
-
 	if (role == USB_ROLE_NONE) {
 		/* default operation mode when usb role is USB_ROLE_NONE */
 		if (hsotg->role_sw_default_mode == USB_DR_MODE_HOST)
@@ -127,6 +126,15 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
 			role = USB_ROLE_DEVICE;
 	}
 
+	if (role == USB_ROLE_HOST || role == USB_ROLE_DEVICE) {
+		ret = phy_set_mode(hsotg->phy, role == USB_ROLE_HOST ?
+				   PHY_MODE_USB_HOST : PHY_MODE_USB_DEVICE);
+		if (ret)
+			goto out_clk;
+	}
+
+	spin_lock_irqsave(&hsotg->lock, flags);
+
 	if ((IS_ENABLED(CONFIG_USB_DWC2_PERIPHERAL) ||
 	     IS_ENABLED(CONFIG_USB_DWC2_DUAL_ROLE)) &&
 	     dwc2_is_device_mode(hsotg) &&
@@ -160,26 +168,40 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
 		/* This will raise a Connector ID Status Change Interrupt */
 		dwc2_force_mode(hsotg, role == USB_ROLE_HOST);
 
-	if (!hsotg->ll_hw_enabled && hsotg->clk)
-		clk_disable_unprepare(hsotg->clk);
-
 	dev_dbg(hsotg->dev, "%s-session valid\n",
 		role == USB_ROLE_NONE ? "No" :
 		role == USB_ROLE_HOST ? "A" : "B");
 
-	return 0;
+out_clk:
+	if (!hsotg->ll_hw_enabled && hsotg->clk)
+		clk_disable_unprepare(hsotg->clk);
+
+	return ret;
 }
 
 int dwc2_drd_init(struct dwc2_hsotg *hsotg)
 {
 	struct usb_role_switch_desc role_sw_desc = {0};
 	struct usb_role_switch *role_sw;
+	bool is_host;
 	int ret;
 
 	if (!device_property_read_bool(hsotg->dev, "usb-role-switch"))
 		return 0;
 
 	hsotg->role_sw_default_mode = usb_get_role_switch_default_mode(hsotg->dev);
+
+	if (hsotg->role_sw_default_mode != USB_DR_MODE_UNKNOWN)
+		is_host = hsotg->dr_mode == USB_DR_MODE_HOST;
+	else
+		is_host = hsotg->role_sw_default_mode == USB_DR_MODE_HOST;
+
+	ret = phy_set_mode(hsotg->phy,
+			   is_host ? PHY_MODE_USB_HOST : PHY_MODE_USB_DEVICE);
+	if (ret)
+		return dev_err_probe(hsotg->dev, ret,
+				     "failed to set default PHY mode\n");
+
 	role_sw_desc.driver_data = hsotg;
 	role_sw_desc.fwnode = dev_fwnode(hsotg->dev);
 	role_sw_desc.set = dwc2_drd_role_sw_set;
@@ -214,10 +236,11 @@ void dwc2_drd_suspend(struct dwc2_hsotg *hsotg)
 	}
 }
 
-void dwc2_drd_resume(struct dwc2_hsotg *hsotg)
+int dwc2_drd_resume(struct dwc2_hsotg *hsotg)
 {
 	u32 gintsts, gintmsk;
 	enum usb_role role;
+	int ret;
 
 	if (hsotg->role_sw) {
 		/* get last known role (as the get ops isn't implemented by this driver) */
@@ -230,6 +253,11 @@ void dwc2_drd_resume(struct dwc2_hsotg *hsotg)
 				role = USB_ROLE_DEVICE;
 		}
 
+		ret = phy_set_mode(hsotg->phy, role == USB_ROLE_HOST ?
+				   PHY_MODE_USB_HOST : PHY_MODE_USB_DEVICE);
+		if (ret)
+			return ret;
+
 		/* restore last role that may have been lost */
 		if (role == USB_ROLE_HOST)
 			dwc2_ovr_avalid(hsotg, true);
@@ -250,6 +278,8 @@ void dwc2_drd_resume(struct dwc2_hsotg *hsotg)
 		gintmsk |= GINTSTS_CONIDSTSCHNG;
 		dwc2_writel(hsotg, gintmsk, GINTMSK);
 	}
+
+	return 0;
 }
 
 void dwc2_drd_exit(struct dwc2_hsotg *hsotg)
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index ef0d73077034..ab39d6b36b19 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -783,7 +783,9 @@ static int __maybe_unused dwc2_resume(struct device *dev)
 		/* Need to restore FORCEDEVMODE/FORCEHOSTMODE */
 		dwc2_force_dr_mode(dwc2);
 	} else {
-		dwc2_drd_resume(dwc2);
+		ret = dwc2_drd_resume(dwc2);
+		if (ret)
+			return ret;
 	}
 
 	if (dwc2_is_device_mode(dwc2))
-- 
2.56.0

