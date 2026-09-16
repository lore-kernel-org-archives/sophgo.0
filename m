Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A714B4046
	for <sophgo@lists.linux.dev>; Wed, 16 Sep 2026 16:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574817; cv=none; b=JvdhXeMJDANDObPdNJxf3VCvnb6qh9K/6CD7s2O2KybX5odPjY3EhBLWxEQDvT0i5locqgTH1hvVNiCZDan9IrAXoVvV6ghNLuIudlT9K0qiV6UwlsqFixfbsPjiUbs6qtxRH3BlB+iNzZikcweivX2Z0Uq7FTAauVaOwTICwJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574817; c=relaxed/simple;
	bh=Ff4OmfN8CYUiKKRCKdpGJQ+e0RrDjxCspxN0MFTfbAI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=luYtl4Xa2djcYSRYF0l2MmmUnN3Ez1beVh2FdSpCWBMkhkE+EmA/2u0JjEagPxp3rNyvv4tbipRGEyC3lLLR4Anb8Yk1mKDojnF8P33gb7VloIm6XGG8EBmLc02TizaQxh6L6qHXrNA83MPaid1qJtAvXivvE6jHMyuIUqUzrYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJNU7syW; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJNU7syW"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d822dso8632615e9.2
        for <sophgo@lists.linux.dev>; Wed, 16 Sep 2026 09:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789574814; x=1790179614; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mVlGdYNhNUu9mC7pDXKcspPVWpvSds0uyTHL3WW6nL0=;
        b=cJNU7syWOjIP3J+rrxfdBoTzEU3nj10dVcRrkjyoz3uWWShvQZLJBRnJ5t7cbLGL1y
         Othf3G1Q4nSdi1L6lBoOke6VMLbqA8tYo74BbfCQaPvtEg1KXWfTITTcIq1f/0xytxL3
         lg5g+TPB1k6lMaJIDMyUEsiX0UQwE9VX4Vt/IKCGo5cK2fQGamhaSKvtqFxHnSyDaoyb
         sZqxTpGwt7YBWVevF6qS+SjGVgTo12Ke/h9ydfcHB5qOq8u/Koa+8llJQMLYUsP3Nyjr
         NMCEd+CZZl6EZ2TPV1viKYDuoKaClOTLpEJqLjfqm4D20bS/vlOSdSrWbv+kJacVn1vi
         yznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789574814; x=1790179614;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mVlGdYNhNUu9mC7pDXKcspPVWpvSds0uyTHL3WW6nL0=;
        b=IjT5v6YRO3SP/4y8dsuG9MRIm6aYF+CySj85n5EzNG6GCzpvXNovYPcPHk9hTOAH02
         3Mi/Fs47Vx1cwLwIPmbcHDf3usMbcvCti0cNX472jUh/tT7uqsZn4N98tJ/O09FHOTvP
         eefsX6wNBMBeAy86wp9l+wNd74dHtsbkIMvsUM46lfXDZoNGjq9BWCpu0JbYPYp6zcxJ
         VCvRTpPYhK1v3HmvQ16TTwW+0bjyJ7p35eA/p7zxF2LMK+hSHfoMAnn+nHWvi1nPsq1a
         YQWqq6+RC+SE++T7Qmd1JRSEHVTkcARGIReGTqz4gg0bp9begHBzV7/9miCD/7lip0MM
         ot0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwVWW3lHJSVyuzAr7y/Soqq/uVxCi3g/L/A55Ua3NAg3iyMCloEUG7sghdgPSXCMGqrvC5juwU=@lists.linux.dev
X-Gm-Message-State: AFuF++lfPs141JjCJ6YvNTHr/kCVWAtM/+l7uHBVvGiP8MfAzOsziMTR
	KNozBY+IFjiBw01EWH2gPvGhvdAPRSQk9fnqYja24yqA/xy7JcPdrydF
X-Gm-Gg: AYBFou14/v0zen+oI04e1CAbY7QcX3ys9C2vu65xPwRSq73bO+1Lj3C8YVlFQSOv8Rq
	G+NHNtPmBMwWaDpRIx5YKImV170pDeLRinOgj/eySREhGZsQq0OLLCooyXOyLV9LshOmFe0HM5d
	AXZrIqNZZOX4/7XFa/EJEq1efMz84KRuVp/++8HZhdmrdIp++YClPMk5Bi6LDkBcQSOPEP5lpru
	f7sLuP3sWr+d2LXB/aqCX011UzJWmY74NHUbRhWjIKpLYpmf7hFsfR8AGlNSkvhzrVNv3DTMsDx
	yWIK/+FkTEvEPbEDHTSq2MeBhcJSaNwxtUJrvsZqwZ5Ge5AYG7a1pIbudViHar6Km4ZJB4lZ4+O
	CFLCdDcUwPmyfqpmu/2pw2x8m+fX7euKc5Qz+TUNtCJQ9ahR169vmCvEgoeJ8LbNfEHR4bHZG8A
	T8OjArtz0Sm6njlPsPcqoW2r7fRAHatvI6iSvY5lGFebeGyF73H7xUzF4N2TC/GRYUn0XCkEXNU
	INgFvDvM74n/F/1Gy81CJgs0OM4hr1ieq+qnuKnIbnnViHiG6qfSJID4dxp9ha85m+VC/j7KjrR
	6zaq/nPDWTl0pzwx41ITsUE6KZHP
X-Received: by 2002:a05:600c:4e09:b0:49e:7c83:4733 with SMTP id 5b1f17b1804b1-49eb733ae01mr38851665e9.32.1789574814009;
        Wed, 16 Sep 2026 09:06:54 -0700 (PDT)
Received: from [192.168.0.233] (2a02-8388-e6ca-5780-e161-768d-5c97-84d0.cable.dynamic.v6.surfer.at. [2a02:8388:e6ca:5780:e161:768d:5c97:84d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e84805db6sm49721625e9.3.2026.09.16.09.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:06:53 -0700 (PDT)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
Date: Wed, 16 Sep 2026 18:06:30 +0200
Subject: [PATCH] riscv: dts: sophgo: sg2000-milkv-duo-s: reserve memory for
 RTOS
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-milkv-duo-s-rtos-memory-v1-1-6ca72d5a3924@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTsJUMWUqxgXQAcYpdTMAIEQ7
 m6V5Vv8v4OSMCmUyQ5CCyuHMSK7JND01dgRsouGPM2L1GYFeh7eC7o5oKJMQdGTD7LhvbJXawy
 ZW+0g1h+hltf/+fE8rXP9omb67eA4vqhb+xp7AAAA
X-Change-ID: 20260916-milkv-duo-s-rtos-memory-7a94933e35bd
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andrei Lalaev <andrey.lalaev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789574813; l=1124;
 i=andrey.lalaev@gmail.com; s=20260901; h=from:subject:message-id;
 bh=Ff4OmfN8CYUiKKRCKdpGJQ+e0RrDjxCspxN0MFTfbAI=;
 b=Y+VhV+8jpUiN0h9+sYkxwnw3QWuHK4l02Ho7OkmUrd/LFRd0AdSKS+0TickZEJ4shfLFUJuOO
 2S/41WW+AZJAmJBHe42pAAri1S7qWDmjEQaA/IN1xNTw5NGVNWvhX2r
X-Developer-Key: i=andrey.lalaev@gmail.com; a=ed25519;
 pk=YHk+K3q98GV/1CigmrEAQ+Vc0o+GlFWt3j94jvrEh6o=

The FSBL loads the coprocessor firmware into the last 2 MB of RAM.
Reserve this region to prevent Linux from using it.

Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
index 78a257839f6f..693c9fd7b771 100644
--- a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
@@ -22,6 +22,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		coprocessor_rtos: region@9fe00000 {
+			reg = <0x9fe00000 0x200000>;
+			no-map;
+		};
+	};
+
 	wifi_pwrseq: wifi-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&porta 15 GPIO_ACTIVE_LOW>;

---
base-commit: 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
change-id: 20260916-milkv-duo-s-rtos-memory-7a94933e35bd

Best regards,
--  
Andrei Lalaev <andrey.lalaev@gmail.com>

