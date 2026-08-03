Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BBA368D4D
	for <sophgo@lists.linux.dev>; Mon,  3 Aug 2026 16:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785774818; cv=none; b=YNiID1C9I9ZyGRXVTkBdNQbfAnpi8B3C4Pll+TZn6iN+s/c2mAluXCeeMQFdvSzIz+LdMaRT95k8oO8WbfFy17YCodbWtFzmTkmh2Payh2dZjwshIDhUu5Yq49YKl904rGKnJVakugn5AVM0MCegl6Ogenr18cFxpZvShJACLTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785774818; c=relaxed/simple;
	bh=CJ30TTtBZNretgYhQgM+OVQp5KZCxXimsEsM2yrGCWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ahJOyn09InwkpvmMl1zDhhdnTnp/kPk49WxzoIUqHnbpuax9F5wY6W2Ux02vy3YZfaCz+LOl/ubrxFiYpYqJ0S0WdHsw3B6Cs2TqR9AGo7RDnXNH8GHwiOcRJnZkm22I7HSLgd8aRTDhYBxCX3pLSqNrq8Ls8lDT4TZtwRZ7vxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LdlmjALz; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LdlmjALz"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84a3323d858so532630b3a.3
        for <sophgo@lists.linux.dev>; Mon, 03 Aug 2026 09:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785774816; x=1786379616; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nFawlb/mI58C0kLJAoZYOhtyyWVaA7JzPyRY0wueT1M=;
        b=LdlmjALzefty+TZgH9e+Jgy7ZcdrJ4otngOXxA3+ockonRIiG7zLBE/amJkQTXiqNN
         efzmI3e/kDR5AyeUwVCRb3uQp85CoMdlr+tLjp8GhugiGmY+5QL2YyVbajDuIjLxfSNr
         30eEkIIVadN5m9WxEJPAtnlDLj5ds05xodkI8EF1t9EXUAcoX8kSCn3JbyocFwwixAUe
         LTEoPRaVfSYYkoztpQFDc0su7ui50AJiEU5xOdQrJXRdqtXs/FcXsFLYb7xRXweQklwl
         aUqUNuuU6vKFjByO0THB4hsPW/TCCRhC9xdyZkOb7NxT2ZwoMbjE6wk089Pk+uSU4xef
         4whQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785774816; x=1786379616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nFawlb/mI58C0kLJAoZYOhtyyWVaA7JzPyRY0wueT1M=;
        b=UCXGI9bpbUD8UQTain9An2EHbFSFTmT7Czi9K5mK9lFe5i3nrBva++xpKZlZKf1MWC
         dCApJj0nhOjmVcGK//RMRfH0fqBzoPb+DE90sfQNaAvgqy3DJjjw8eeuwJ/Da5DIkVE4
         KcKxDNgxvVuUGQrmglBdbzxRIoIbLTXg2kTL7Shkhtn6QGLnwi6fBKXHF9u60EuA7Ai5
         bIpMgXVrk3clsbf/oxwxSPIC8zowShgCZq99Xoy1Ok06Tjfm4FyEO+vWeFnayiM7KQ4Q
         5mYjZme3R9PS9RrBisMonnX9KOw/Pq2M64ADamQT9gWHCPnhLecRD+fOJJLKQMYOMmxk
         4CFg==
X-Forwarded-Encrypted: i=1; AHgh+RqZpXTW5aq/rmka/YN/K9EFNR6DLjyVSgDIBxN0CN+JxR6qqTZz3XgoQHiPxDNQ03LQAfGFYos=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywvq1XAujTJaOODk2fsq2UiPIlQtJYG7KWdS8WAl2+36WRbhUE+
	RNPPTe1teiKftLU8LthSKeMiOGFKNoc03WNgjJu3SunEd2pC2Ng3X11o
X-Gm-Gg: AR+sD11xS0VpvzwW+c+dkcSlsz31iZJcNG2nkgcDkKoVNBOAD1CFkGZSmVDpmpD6znN
	wnT7EOAO2BVQmoiWxiSFiOsrefxZCQHxFE3F1KBGt3IH3+bJxnYN1Ye5KakwhqwPgO1q2yPw5qb
	7QZyO79HH0e1qb7xK2ur2X2KxvooPRRgfYHy0CRBbDZh+F0QOkve38lydy334/jWTE5Xc8VHWzV
	6e12zMfdWqX76MrqFkAMB8ZyVvNVA3vW6Ptbmyw+kGUoLUfeqBObruLVX+6v1Ta8ntUw+sbqaj4
	5yVt6FpJjc/SArFKEPn4HgTBlJVFogQD419pCZdbMOgxVI1HWyUvJ51RHGzlczPnhFvMm6fDfNF
	z98tdueE5ROJ8NELFGkQhf1VDNM1xMPgvx06/6c6Q93gAjEkibdEYiS0FRvZezepJpVaGLuq2No
	fWEX+jYfzahLQe/IPSVhxb7YtggFfGAiG79TLFma5vH8dbWGfZmfzrw+3GczjWK+MilV5tN9FPI
	YBWb+ZZ7TVRUjiLqjvj88Ctc9FN+HSsGxxAwbHOUaUCWQw7xy5cArC12QVcB3T3rluh0mO7jvKc
	slgX04waxbqpFtVAo4VYloU=
X-Received: by 2002:a05:6a00:4b08:b0:842:5a15:6fa6 with SMTP id d2e1a72fcca58-84ee495c2aemr12701073b3a.3.1785774816045;
        Mon, 03 Aug 2026 09:33:36 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbe565d2sm4164845b3a.13.2026.08.03.09.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:33:34 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: chen.wang@linux.dev,
	inochiama@gmail.com
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] riscv: dts: sophgo: Enable ethernet for Milk-V Duo 256M
Date: Tue,  4 Aug 2026 00:33:18 +0800
Message-ID: <20260803163323.74414-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SG2002 has an internal ethernet PHY, but on the Milk-V Duo 256M the
ethernet signals are only routed to the RJ45 connector of the optional
IO board.

Enable the GMAC and the MDIO multiplexer so that the interface is usable
when such a board is attached.

Tested on actual Milk-V Duo 256M hardware: the GMAC probes, the MDIO
multiplexer selects the internal bus and the internal EPHY is detected
at address 1:

  eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY]

Link-up was not verified for lack of the IO board.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
index a2797c0bd767..1462a96a1c12 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
@@ -49,6 +49,14 @@ coprocessor_rtos: region@8fe00000 {
 	};
 };
 
+&gmac0 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+};
+
 &osc {
 	clock-frequency = <25000000>;
 };

base-commit: 11881041b745b444e4f6c87a2748f1951cf02742
-- 
2.43.0

