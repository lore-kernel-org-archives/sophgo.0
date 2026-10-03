Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91E43AA4F8
	for <sophgo@lists.linux.dev>; Sat,  3 Oct 2026 08:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791017213; cv=none; b=tfZN5plGDuNaiHAhw+dHmc+npk7JhGGxE0Xoh5KXlyxHV208+l5EFVw/KOsccUohKK3vy9/c6DwBmuFd5nKfrQXdKZiuWP9/v4yY9KzyXO7qnZIB9yO6pVZkPDie41MeGh17GHVX8wOChmPN35DJpOMOpeNgQI7PvuOwPcIOMPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791017213; c=relaxed/simple;
	bh=X8Qa47CYVA3jb3xwrWDiCUnyO5eG5JwR6h7Z7o49DH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IacSeGZ4i1L9XpSKEugxjMumf0n6djTUkAPM6tztrsRWvN+jzvQ6u2SRgJyGaVyYz+lziio9gGeRXxFh8rWKjZ0r26yPgieasOUCkjM/YBnjmg9keYBijw4zim82NoehaXb7sCv6YvlRbBB55BR71bQuamAEd4pr0t0LR5afwlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MT+7pUoN; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MT+7pUoN"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1ab17a156so66370a12.0
        for <sophgo@lists.linux.dev>; Sat, 03 Oct 2026 01:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791017209; x=1791622009; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DxxheazlFCgAiD+d31s/AiAJsZYYLo8W1wj/LuSYOIM=;
        b=MT+7pUoNGX89b9YlUSifrNqhHUK7QDVdh5YQ761Qb1qnlQ38Xa7welSg9Z3HEVNfYz
         lQ3zDkhkk8Ceu56C8iGaK3WM+ofbvjkzx/07DmcjId/BkFnMhzMCoVLERuqcZWPdhweI
         OtT0kEbA/jdD4FUTfOFQp5+wrCVxCDpx/W5lOjQDaQxR75pkseXhPp7Sf6eBo2XFOg4w
         vI15wQE38amspHNYP0UW72GpiAZ7XA+Zx4T0ujc3KQK1fxZjwbOaBcPihnVT3XhIR4zO
         LxFhOzY7MQfg0rJZlvFq0FEU3D2I9lQQyx/5lSdpwA9ZjkkHKMMFiEkXPb9W4EFEQR/l
         gp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791017209; x=1791622009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DxxheazlFCgAiD+d31s/AiAJsZYYLo8W1wj/LuSYOIM=;
        b=X4jsLFERVNh/oiZvNG24CT9PruvqWI2Te1K8nrHNRDOJ0/2QnE1I4t5rMv0+x3/6O+
         N5zHDM2PgsAOkFBJNkWygqB0YIqCFv4G31q6VikIkIrjHZJjA5bPnNY3fHV4Bs7nNikF
         1XTOJgZ7lfX5+mPrYnVoYj4SAbX01qPgUH/g4q+BLqRy8QH6UMUxtOQY3cmTFZyoshsf
         hUTurjFDn061WMcLASnqugCoWKt6hXp7ML7GSKP+HLrti/nV1xQp1F1UIuYwERiVd6lf
         d9DfbRIwJNPvPh9QHVod9xSL650glklOQRZHcfcXNwFfGIwnE36H3Q5KCOb7F+KkNR9O
         zV1A==
X-Forwarded-Encrypted: i=1; AKwUvBzFocHdpggq+Z6p7WviXQ2xffhvQsbV/v5LDqikcz701PUKPeVh7WeL6kv/PGgIH8fgYFX6ud8=@lists.linux.dev
X-Gm-Message-State: AFq9FYKbVBD6FxRPnuu1SYp0TBbdvNaLS195asmFzWGJyFS7vmQ6n3o6
	5Jo4nczwfqZv7Utu/0yXPoG5lQUGcIIGpAEDS5Uiqxlpuzi3IhOHWo03
X-Gm-Gg: AYBFou2pIRhkNhz3vKQaend74WD7qYvJF0BaFRR3PZx89UPJK58v1lJwabEGLMiHwxs
	HWW+fJurPan8SKTnPGqDnUyvM/ueKd3rkwM1mc4anVkJqzu7kQerF9qqfz86ubQ5vAcR4zt+2Kc
	cL3l9jqUIupQhtcXRFVAfUYKzPpvcOqzsKb+uNQUpaSuPkUZRUyM+fzVEF5me4cPyWvZE0wo9oI
	6gJE1vx5wjGuHQvlAkYZyaCEtbGiCT7sTwhMPdSUwAVCcitTZMUjM+5S13M+SlfqJ3QiocQZ1Rz
	4qxiPeNf4xReoou1JcFb/Y2fS1rB12TfRazKxo4Yo2QXvLiGXT+zvQRrDimbtOGMrBBPJ4vImuo
	Z6C3ECnEqdODWMSEXbWRVUXVeMEPVzUM6tQfSAJlSiItYDb3/KSlRQkrTMa0Zwduf2UbmSVjBHE
	OISqVq8HbKfNqJkZXSRBifaL9Oj1qpOi0JtHtIF9FlGpjBwn85SFmXnIj8fy9YOv1HkKyP7mYUN
	50LGJSy2dnnqK2nWwxpbYKWuP8AFUTQpI3cjiIVDAWCWZweTDGFyceOQtu1XkgWEhX1vBeD
X-Received: by 2002:a17:90b:4b83:b0:3a6:e1d1:e511 with SMTP id 98e67ed59e1d1-3a6e1d201ddmr6386816a91.4.1791017209449;
        Sat, 03 Oct 2026 01:46:49 -0700 (PDT)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4664ebsm2208033a91.7.2026.10.03.01.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 01:46:48 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Hiago De Franco <hfranco@baylibre.com>,
	Longbin Li <looong.bin@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Joshua Milas <josh.milas@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 2/2] riscv: dts: sophgo: cv180x: Fix internal ephy node name
Date: Sat,  3 Oct 2026 16:46:26 +0800
Message-ID: <20261003084627.353899-3-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261003084627.353899-1-chenyou910331@gmail.com>
References: <20261003084627.353899-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The internal EPHY node is named "phy@0" while its reg property is <1>.
The unit-address should match the first entry of the reg property, but
this is not checked by dtc for MDIO buses. The kernel confirms the PHY
is indeed at address 1:

  eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY]

Rename the node to ethernet-phy@1, which also follows the common naming
convention for ethernet PHY nodes.

Fixes: ba1abacc57cb ("riscv: dts: sophgo: Add mdio multiplexer device for cv18xx")

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index ec3bf305274a..cf672cc6b935 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -71,7 +71,7 @@ internal_mdio: mdio@0 {
 				#size-cells = <0>;
 				reg = <0>;
 
-				internal_ephy: phy@0 {
+				internal_ephy: phy@1 {
 					compatible = "ethernet-phy-ieee802.3-c22";
 					reg = <1>;
 				};
-- 
2.43.0

