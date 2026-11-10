Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294412;
	b=rV0f4qSvN8tNoBB5zyK4M3IVDKZrieLDHfcG6UyKRRbjIMQLh2NzWOPSUDCd4TExB+QM
	 g2kYHKowWm7wtB7rlrsp4xe474FEhpJwmBOO4rRDF1U4dpTx5Txo7pbNVwRfkhjEnguKG
	 FeoXjYBjRiM2t5ezO7hFSmOTt4chF8g7yOPBUDG2xzXliJJHMgsWRIauSR9zhBXGlMtVQ
	 g1xah/vFedO5hJozIlhk/fOE1gq48fIQC8TMD/KVYdmI+AJ9XCn7NKtOQZpmbYwc1RJBm
	 MQIm71lxmotVoIfOp7F24sCkiksvam1CG0BkFGqtm00trOL7WXSgfkXmJce+lWu/pkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=unKmJDdAUE6W9/H4slkPzsgdbPWz7GOGEzJyQiys7w0=;
	b=BJ26Lg2l7J1Abpx6bB1WyTX2Hh8wO5DbDr/MBgYTeGFH9NK/hE44YfbbHXwHVlKC4hD1
	 p6gPJO8+VK8oiyPFWQX93dW5Y7B2/8qwrMm/Ci+tWQ2pIKJuTwBzZCqQilMXcPWLXntZc
	 OJlFu2Dk48lVtvHrkkBEAoE+ug2tXDn0z7f3YJP9inSjf7Dm+XUIzvsUlKN33dQF7ra5j
	 ig027LHUDI083jMUNRfnyldyLZoNG9ycUwfJCnd/t+gXcjj7ZVX/iTGtFSo8R1Wdsuzzl
	 Kb+Soapb7dGW/V3g4vKXvXwQUe+xngHi6RoHoUEIofQKSAza1wYCABRMqb8VhiSrUSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPm27lAq;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C23C60A2609
	for <sophgo@lists.linux.dev>; Tue, 10 Nov 2026 07:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C23C60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPm27lAq
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso620839a12.2
        for <sophgo@lists.linux.dev>; Mon, 09 Nov 2026 23:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794294411; x=1794899211; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unKmJDdAUE6W9/H4slkPzsgdbPWz7GOGEzJyQiys7w0=;
        b=wPm27lAq7XJpmw3Tp/J2n/XXeqZOvadk43q/fJni1fQNpeTHHSoiGfaqo3G4zlq6LB
         XdRO3j0Nf8ieZLhZBMiETJzobPTu0OCqTO5fYxgWDcpjwiUD7loU8X8bvlSlixeUGYEA
         zliMw0YzwprwpMv5Zrj/HZGo86gTMx5Eply7Xg0ebE1S54QDsYg+mbJzG+zmmtQfOkEg
         c6YGw8SWzIbnFQfpGfe1iVXTWOv9pu2VbqngLEsT4jd+L/KyMg/Qp31u2LhKe2oGTi1V
         UBKKPg4Sxu2UuuJa+OFvCyK8xH72Al8PVsQ3TEwL2fnnIrGapX46uNohpwNoce19Hu5F
         ZyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294411; x=1794899211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unKmJDdAUE6W9/H4slkPzsgdbPWz7GOGEzJyQiys7w0=;
        b=Kts2ACqnAiRN9sWe4aL2Dt0q3WE7hWAzPevbOgfm7iVeA0HzO1aoh/2kYk+EX/Dpl8
         rYzkU450azncHdvV8ja6SxwjfegSzfaMs2B/zuFQoFkMtDu2qMJHcL8bxIJTZVgMPfM7
         FdFZ8JeAeQouushR6WCE9JEAa6w/5VDjgO/Ej/el91oX6bq9h+hrgfC5bhWCRmD2RArj
         0ESKKNYtdZyeWlMJAoHGbcH1sfiWEvhxpHIlq+sM1PFDbK0ai1MmjTecBuZvw/Fs8+/3
         8iqwdJKJGqYeHqriq+qHzqeqini6+4l3KPBCnOeV6MTd/fyo9LoQfscxFXxXA2mGl6OW
         kYUQ==
X-Forwarded-Encrypted: i=1; AL+hErHCp+ixW1BhlB9KEo0dfuXbYQBbs5rGk0ivaJ94vQx2JlVCqKrh10vhScGd+YVLCGAIE7xQkkE=@lists.linux.dev
X-Gm-Message-State: APuU4Z/e6TPXJWo6juaHYFx/w75qZ83gFez7v92acyCHiMqeSA/Q7NxQ
	8SgDpYvSLOT5u3ojfsQKS85cOUo9H2C0b1xLxUMQG0YLopdym2sV2XC4
X-Gm-Gg: AYBFou26jObI71926Td3QaXOYnucrXW58f/UxiME6VV9smprWZkyKmkVkZoezT7hRco
	3o4vAkk2QzdR7BekK2mwcgl+5qdqfoN58mVAr8s5EkQgCi/XocQ9TL0pI34d0bvgN56N05fJP+E
	bG5DPkq0eHUKDWpHJL2cSx+G/DvwnTu/qZIJWBdYV9f6mlMXBvm+yeVpUX0b9jWIJbqaDb7JUxx
	k4XjMFmkoyjfP0c7lhovtGsOb9a25A+KS+9LfX730bb/JNffCgwtlZlK2LnizlxkiTCvIB55Kss
	AguOv5DpdgyNKUMB8mCHf40RJEJAQgMCC4jEFwIq3JrRMM8hVG8QTIxMiOlnfw66t8fhg8hyyKX
	zZk7cNNzhSj1s2Gh/yIj17JsBA9ZZbJWAXnf0vjYfcS6Pk6suB+7RPgAUYtMO+gHR4mpCBGMaCF
	Q8Secl2d5OOj/Q3kXWal8bp6oRXfA2Ehc7SgtlGEl2Zv6BWiX9hmtphWME7TtWOb4gK+SPIDYXJ
	QlKS9PuF9UWxzHRibnW/ARUTevSWjG43MEZEzIv3s3xnl2nA8s/Pm2PBi6TTE8YiKJPf/lpTyTS
	1u+SXTBJUJi89O7mU7dpgJhK2r/4G2Mf8krM/VYg7mN15T4x
X-Received: by 2002:a17:90b:3b44:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3b166d12825mr1909705a91.40.1794294411341;
        Mon, 09 Nov 2026 23:06:51 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b167918e94sm2647121a91.11.2026.11.09.23.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:06:51 -0800 (PST)
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
Subject: [PATCH 1/4] usb: dwc2: gadget: honor pullup requests in core_connect
Date: Tue, 10 Nov 2026 15:06:22 +0800
Message-ID: <20261110070627.217946-2-inochiama@gmail.com>
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

The connector ID work initializes the peripheral controller and calls
dwc2_hsotg_core_connect() even when no gadget driver has requested a
connection. After a host-to-device role change, this clears SFTDISCON
and lets the host enumerate an unconfigured gadget.

Check enabled in the connection helper. So the device will keep
disconnect until the controller is ready

Fixes: 510ffaa48eac ("usb: dwc2: Initialize the USB core for peripheral mode")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/usb/dwc2/gadget.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 6c8a9f05fff0..5c8e85493289 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -3664,7 +3664,8 @@ void dwc2_hsotg_core_disconnect(struct dwc2_hsotg *hsotg)
 void dwc2_hsotg_core_connect(struct dwc2_hsotg *hsotg)
 {
 	/* remove the soft-disconnect and let's go */
-	if (!hsotg->role_sw || (dwc2_readl(hsotg, GOTGCTL) & GOTGCTL_BSESVLD))
+	if (hsotg->enabled &&
+	    (!hsotg->role_sw || (dwc2_readl(hsotg, GOTGCTL) & GOTGCTL_BSESVLD)))
 		dwc2_clear_bit(hsotg, DCTL, DCTL_SFTDISCON);
 }
 
-- 
2.56.0

