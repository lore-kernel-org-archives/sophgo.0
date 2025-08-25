Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7763E287253
	for <sophgo@lists.linux.dev>; Mon, 25 Aug 2025 06:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756104994; cv=none; b=XFRRQMJ9nFhQlF2xXblHJrLf/ElcZHRNBLio1fKmSmfvAz5OGQDhrGwaeMDo+++Fj9trvFz0EzwyS8y9P2I4DRz4E877gjjsRKlcDKoD92hgCyMxA2G8HMfzZmo4fy6gypvc/PlH6di1SeiHpQ2Gz7daGrahM3cJZfxkjzmjgIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756104994; c=relaxed/simple;
	bh=cnETHiuRSssaBEiTgdPtwlHAn/fBOMXmkTLrBzYJ84A=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nBoTEPOdpmgYt2nYQSLvrld839B04kPW8EmhowrTtN5SUZWvBzHSQ6yo4P5K8jLJpfoASsWn2lMMwcXrUb5LB+RF7tAU5wK5f0iBIce62bRoy87taa1hAwme84WP44FlBRoIzfRUOESCHo+GJApdevJ5z+5YYQ4SYqmOblMTj8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkTsJHJJ; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkTsJHJJ"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-30cce8c3afaso2600887fac.1
        for <sophgo@lists.linux.dev>; Sun, 24 Aug 2025 23:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756104990; x=1756709790; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fr502dmQ4odPuahV9+jfQPzgPn5kXy7yEDTTv9ShcH0=;
        b=hkTsJHJJnszzbaNVwh1BapxA7Z0GMOAwujhnxVg0hx0WPsQ6NEb1PvLtalCnLXX1JN
         uDtTswComZgVo4CTigcq/ca3UsIoz3x00igG9aTXGPHCu6zzzmNLIXcNm9/7GMSuYDAZ
         RDBgq3E7vAVRll/mzSQey/+zkHRYFe/o7RYv1bReW9nvvSzn5cTGcj+E7ogJSwbvIRo3
         gTJ6A9jCU7JCqUL98tj7oJWj9pGkRT1xy3Wtezfl9jRWi1TEjx2HyRNyZDrmsMdNX4Gh
         7C2oo+IOAElShauAdYyKPW94RtFGPnRubTaf6yOljSDWEqzW5zYvffp/miHk8vccC2N8
         4PmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756104990; x=1756709790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fr502dmQ4odPuahV9+jfQPzgPn5kXy7yEDTTv9ShcH0=;
        b=b5wlvvDueSVo249nth+gRjYKEqtSXp+9bheC8WHLslON+Uy/mfk3DKy4BRkrVM5E24
         qPMqQ16WkUpymtfD+Q0/CDfzKoZURKRfv4IceEQih6KfBEEnHgV0SvAVjUtPO6yPpmfo
         Zo3r0MsfpqhpFYCKM+cKVG3aphrt62thMMgz5SvQj5Op1fwBN7KPhsHcKT4EiXJJDML+
         RvFoCbYZtv3Rgs8sKNDwQ9Kh5XLnOK0nkjJAvOJeuylmFUVi2GtZBi2lgXlLWYpk6E/n
         8h537hLfKcvt9CGxiCymBns4Oeyz7yOlWclIbxJNgXsvE/WRSXxUlC2p6O9rcJXlSb9F
         NgaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+53g5XGEBkwUPeoy7vejt3HdIkyEBZm7WMZsKXvQmXMZKaFVgBWm0bRkjaARdbdivgeABh/U=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJsG3hlgdePAiI/NmAVukMqGCF1DqMyHKqQ3M5hl6vd+qL809a
	aOFxCHgFlqGtMPGVu4ebBuptTaGvFy/c7hZahKIpqXJX1faz7sz8nu+J
X-Gm-Gg: ASbGncvdx7ZlNyvKrNKjGhPcnasXrBn+fu9HCjoxaz9yFsiD8C+llRQLLKgmC9OC7Ph
	9j0QlsoU5QRKTWoVP2B1btqIYYPoQukDmA4p8vDb+S4wp14U5Y+ZLwIT/qR2ZJwL9jdw4QtDS3Z
	X6nfS5PQGPo7YZvdge0YWc/voTp/K5CZ3+NA+OKMdFsFH1VbfOoR+mVdvX8yA27ikxi7ekVuiHq
	RzeyV/oISAC9KupqK9P4VB3IPrK3zLlavK9iZ0HqgdEPCw0JTHjcBgYB6XLcI/zFGNJ5dinGzyE
	lvgIRWM/lcfM6e4pVn7qi+cKNUmbe0A/Thvr4UEjMfRlRvLoIuBTfuJUBXtLF2EoYJef3FPmYKV
	+77XpAQ/tbnw2lzuC0Pp0OYlAt+0Ra5C4
X-Google-Smtp-Source: AGHT+IFR7r2iERKhQBivRTMEUEiZRAfQkh3FKggj/0CGOOtJuAdCOPNqJjADbkLjgPMG1RSVyRhGKQ==
X-Received: by 2002:a05:6871:3a1e:b0:30b:6e6e:3477 with SMTP id 586e51a60fabf-314dcd2dc5cmr4797064fac.32.1756104990380;
        Sun, 24 Aug 2025 23:56:30 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-314f7a21bdfsm1630277fac.8.2025.08.24.23.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 23:56:29 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	inochiama@gmail.com,
	krzk+dt@kernel.org,
	looong.bin@gmail.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	tglx@linutronix.de,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev
Subject: [PATCH 3/4] riscv: sophgo: dts: sg2042: change msi irq type to IRQ_TYPE_EDGE_RISING
Date: Mon, 25 Aug 2025 14:56:22 +0800
Message-Id: <6cfe6dd32d875fc6811d74d15afe8719d2368308.1756103516.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756103516.git.unicorn_wang@outlook.com>
References: <cover.1756103516.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

The latest MSI driver will read the DTS configuration to set the IRQ type,
so correct the IRQ type in the DTS to the correct value.

This field in the DTS was not used before.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index b3e4d3c18fdc..6430c6e25c00 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -190,7 +190,7 @@ msi: msi-controller@7030010304 {
 			reg-names = "clr", "doorbell";
 			msi-controller;
 			#msi-cells = <0>;
-			msi-ranges = <&intc 64 IRQ_TYPE_LEVEL_HIGH 32>;
+			msi-ranges = <&intc 64 IRQ_TYPE_EDGE_RISING 32>;
 		};
 
 		rpgate: clock-controller@7030010368 {
-- 
2.34.1

