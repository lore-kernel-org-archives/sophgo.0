Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E0C45D1A8
	for <sophgo@lists.linux.dev>; Mon,  5 Oct 2026 09:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193106; cv=none; b=CMQBcS+Ld40/u5iIH5BRYoN77F3jRVqEr2P95+1eefSWUTWNclaSE8SODKR1sdwl4Hn+HsZ2gSeOIKfSVHK4dsNe8kbsILzfaEf1x6lRTcV+6/rnA/i4MtNwKODd0rRzzUVEb8w+xaL2XqQyVM9bKrhIQhht5Oxflkna3hDUeaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193106; c=relaxed/simple;
	bh=deANKfbzeo8P+6mjFcg+WjVuDRCAY429YUB2BPT3dak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cZhT4n9EmqTxc76B6eZ3fEa2w/8oUjaVa/UvxVcxUIAiuB37HHqNJ8RHPmrYkhgMdjyZF7nnOVFEQHONTdxTArXuJI9cO5pRtbnnDdr3U5e5pi+2FTPrSYU7lwBf6xIV4el8BwrIZcOIdi4mgeXm+Wlz5FvagCvVuwsfihxSUM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZG/OcTdj; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZG/OcTdj"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a4bbc51755so102287a91.1
        for <sophgo@lists.linux.dev>; Mon, 05 Oct 2026 02:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791193094; x=1791797894; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ffwk9zd7Q1dFpAeiEuMaDR3BIsGTNaq+nzEVxlzFSrI=;
        b=ZG/OcTdjdycHl95CKcZFURqShUcva5nlAvgNq6g7+WXnFMcydGMxfc6SIKC3Kt25l2
         9jzX0X68dhek0VXTs8EFykvOKQL7AjKTpZzJpWC1lrLMCUfRxg44/Mc3mlypbU8EW2Gg
         n8w7ea8cOntX/kJIcfmm++DIEQqiMyM5/l6cH6gueW2eS8Mfow0VpxP5ApTL5cAlNCGr
         PFrdGggtZ8F8Whq62FWqwfkHTfW7I1J9C2C8+krGPX7Z8JQL4HSk+V5eyRwDUIFycqr+
         8CFQmiIJWTJ3ZKLn5FOVEXGI9mcVg4AeaXr7b3Aafc1ftHNVA4cVvwCnaAAXT0zgmzw+
         l5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193094; x=1791797894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ffwk9zd7Q1dFpAeiEuMaDR3BIsGTNaq+nzEVxlzFSrI=;
        b=0BeeKtzpHI5xZeqR+RgDTY2SW6+ZIeXZVYP8aLrzg/T8Z90vF8IjpTWGT0TM2U8kbj
         TWTyemlGmggAzSjQRV4srWKpgvfQeBlHgdFxhONiZllFO0TylbZ4K+7+77BvEUM/URjd
         iwVc5J7tsnAR7o0JNNjAOLYDVv9Y2HYpW6GgznB0hAk3lCVPICrlgFUGp4mQ4q7Reh69
         Y3T1e1/YVSqIEiyJVajbmDaNJ2Wj+nMK7twsZA+AZPWjaeO2Um+zOTj2tVyC78DgxPpJ
         0pi5g/VdmwhlNvSCPio3bSH09VDrI15UwXV6QBQP0ZLnP4fHvxwbW/s/Bs83BPqUvq4L
         ZvwA==
X-Forwarded-Encrypted: i=1; AKwUvBwTdA1P3GWi8AHZCWNdglkZxmLnTqbZIhB2U8sLw8g/HIU9mTKx5q4mgjhtePsBA3Nl7xAJvcI=@lists.linux.dev
X-Gm-Message-State: AFq9FYLhk85/SijkDh6xJ0SdzSvKohEI9g5fvTgORiiv887uMdEqPdU8
	q+WHqDjTlszghtazYppUOksfX2hRWc0jM84z3X3OfTsoS4xPFciI5J9o
X-Gm-Gg: AYBFou3chHKszLxMNK8DuZe4ZnT/0mkh4kpHxb0ytzjljBO+qdQk4z0yOhk8dFpVvcq
	+hwHflbDIQekfMf9zG8lJbqj+SpKPDjvxaNFtlhxTwmLuMzS+W7asRz//hmgzKu9AQjg9I0iKZk
	OYLRzFgTzcStOgF0JRXD24b8z/9CLe/CTIA1fWlaFOjO3pZNO6LRwL8tORMT9abESFIk4Lz7+hE
	Bn5K2hWIEfpLIzON9YydA5VitpeV79Iyd9DkQh9+X6fJBIUijjaKok48AtBowD/XtfsSH+O2JSU
	XJ3uRShL7RjY4qJgfdAQVToABdH1SYVmJF96yEj74FdVDiFzhncVGHJBMDfRXkrzoCgoZZ664Xe
	mUMHkOrtkcdchVlUAe1fpcJSBzOyhld9D14uyfACCiAW/lRGsZXfMIUrlUYNw6nsXL1cAJry452
	Lz4Cy123Kf9F9TFcJtqQ6l5pNt1peYildgBY3YnhS11um4D536iCE0m0Vc7dbzB5P3BC8PhuFeu
	cTv33iazUjrw8VjNn0lUMSVh5h5K69tPl6WaXuEqPK377x5Oapj5g/1EgjZb0p8kVJ3WQ==
X-Received: by 2002:a17:90b:4c81:b0:3a6:f1d2:57fa with SMTP id 98e67ed59e1d1-3a6f1d2701amr12943495a91.4.1791193094249;
        Mon, 05 Oct 2026 02:38:14 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e42026fsm10568067a91.3.2026.10.05.02.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:38:13 -0700 (PDT)
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
Subject: [PATCH v3 2/2] riscv: dts: sophgo: cv180x: Fix internal ephy node name
Date: Mon,  5 Oct 2026 17:37:49 +0800
Message-ID: <20261005093749.645014-3-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005093749.645014-1-chenyou910331@gmail.com>
References: <20261005093749.645014-1-chenyou910331@gmail.com>
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
Reviewed-by: Hiago De Franco <hfranco@baylibre.com>
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index ec3bf305274a..d2ec70fd515e 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -71,7 +71,7 @@ internal_mdio: mdio@0 {
 				#size-cells = <0>;
 				reg = <0>;
 
-				internal_ephy: phy@0 {
+				internal_ephy: ethernet-phy@1 {
 					compatible = "ethernet-phy-ieee802.3-c22";
 					reg = <1>;
 				};
-- 
2.43.0

