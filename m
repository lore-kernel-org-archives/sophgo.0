Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABC22DC770
	for <sophgo@lists.linux.dev>; Wed, 30 Apr 2025 02:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745978992; cv=none; b=rPEXwrC1bnFUQ2v/bshRDuhKtn4EWDYxyCiHUok/6Zabi8uXDqXU0cLEkLKoJNk/dig8yUf/jq9zD0jaObDavaUCJFIwiN+AQGxuXN1jC2Kp2+ka8o9CNtE9w1DJOeihpf873Uax1UcGFfMlpXTD+EdkCjtCGawGH43deE8vXP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745978992; c=relaxed/simple;
	bh=dJDRfGSDRxXopbOKTfj5XmSOmmNS7V2PF5CY2+miZBM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g6FhU4C9oH/8EuHjRTgxV/AcDFria2xn8WnlFLG1EYCYKgnsfz8qr/hxhhLimLzMl2vY5LnDI+eWwIPYS3b5zIkiGdNRQEz9bS0LcEh8zlh/Zn1FuNkFnk3Xqx83nchuFFd/Am8ziE5/RNLPZrxmw7i1IsQFQitl8rmOr+rU+Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTHJBiL1; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTHJBiL1"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47691d82bfbso151193101cf.0
        for <sophgo@lists.linux.dev>; Tue, 29 Apr 2025 19:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745978990; x=1746583790; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gMRCqnYomW+wsK1zzIEugxafFdeEE4BP1eOXuKoDm5I=;
        b=hTHJBiL1M/HE568S0punhxC50SQCAahwESckm/QrqLlpLys7EiNrrq7errZv5a8FYN
         QautpUpEwY8qIghP6GufLM6lEJPxRT9fXpSKyHuZWPZEJlNDNUbZKnXXqaJ/b8qFJOEH
         VCaKBJrSmfmfSE+P4bxDkmwGvi9nAmvaiuaJGlAN6finK++wJsJS2IyE8p4vGgR0AYKE
         nicnDlzinsvP07jdqQbenVcQAMMGWTCHfeESz575VoinfooUe6Wn1ABpeiH+NYF+GFNC
         VZ37Mpj1zJAD+5EilXK1gk4mwnoy8heQmv5INOY7cblDJGHrFxD0rudN75+oHERg8+As
         JWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745978990; x=1746583790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMRCqnYomW+wsK1zzIEugxafFdeEE4BP1eOXuKoDm5I=;
        b=BDgHZfVmVreXTfH3iNL8y1VLTEHC99kvyfix2C9xcF+auIYiJ575zrW60rsBmWjtfQ
         J/L0rHJau/Uvn7805C0NVN4wa/PaqldZiyzt+cROwXH/tAn/KtycTki7/uBKdcFkkrlG
         Kv2jxsmANC6C/akf200IRIk/0wELb7vdTb5Ep20FQS/PuNjCgQI46CBc5cmiN+B1jUbr
         h3rxHcqzxkI/yhZXVHkQy5aBb6cKqSdNLeDZfwVZ8KLQ8nTt8AL1k7ad4u8I589vR9YL
         eQLTbEIS9bdt/u5LMePr1ndD626MQ9CDLksMPHDLjeVBUE+vLbOqXMcfMGIDZ4vuAOn8
         1p2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnbMxXRsvDXW01bCa85dCF5ZcMF4bkdnbNdT77NnqIM9jKuGt2x7rDoohMY1jbDVSgIhl51cs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+4on7jTyhkGiPi8wyZlUfYbDzGlHiYabzzU/KCwFTBPZmqNsM
	X9zie30++IaVvjET9ADKlD92aYlyMDZJTiiobVKnBU8DerA7RNLg
X-Gm-Gg: ASbGncv3amnnEW3dQHcm5h2/rk5AgiQle+/6KLMRpRuBEfdhqdMECFrGQhYw1ejCyWn
	9vBMb3WjmeFrWU8pFznos/F99qZMdA3KVucn/bLp0cze7MQGMirjXcd0N3dmmH1uCV6AWXs0iZK
	PIZok+gB+Wqh+BvF4RVrim+TqJjZff9ZhGNMlV07BQ6j+brDpYNebSZEVypiPKB8OXPTUfl1adJ
	T0MCMxy9VRVL6YasAGlIrRzfdAE9VmTIvbZOEgXhs1dVkwbXTV3yVpTFPYSMvOFN3QhPadBP2Bg
	m63P8012hA5Lygp+
X-Google-Smtp-Source: AGHT+IH3QEcqlp51tOnN2l6ZLTNjrQhnIbAtp++1IB7gybN/d7hCg0IFcRClQaapkL+poJtpoZTgVQ==
X-Received: by 2002:a05:622a:2617:b0:476:60a1:3115 with SMTP id d75a77b69052e-489e63d86fbmr13994811cf.33.1745978990109;
        Tue, 29 Apr 2025 19:09:50 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47ea1ba2868sm86855891cf.74.2025.04.29.19.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 19:09:49 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/3] riscv: sophgo: cv18xx: dts rework, part 2
Date: Wed, 30 Apr 2025 10:09:28 +0800
Message-ID: <20250430020932.307198-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The part 2 of dts rework replaces precise compatible for existed clock device
with old wildcard one.

Inochi Amaoto (3):
  dt-bindings: clock: sophgo: Use precise compatible for CV1800 series
    SoC
  clk: sophgo: Add support for newly added precise compatible
  riscv: dts: sophgo: switch precise compatible for existed clock device
    for CV18XX

 .../bindings/clock/sophgo,cv1800-clk.yaml           | 13 +++++++++----
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi             |  2 +-
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi             |  2 +-
 arch/riscv/boot/dts/sophgo/sg2002.dtsi              |  2 +-
 drivers/clk/sophgo/clk-cv1800.c                     |  3 +++
 5 files changed, 15 insertions(+), 7 deletions(-)


base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
prerequisite-patch-id: 94fb3d26e017cf839b4dcb4bf85624614a94b9ac
prerequisite-patch-id: 8f4a8bdead0e4e3d6904adbc0fd150b7dffefc85
prerequisite-patch-id: b30e850690903c3ddc3d8bb77a99e97934dc9dde
prerequisite-patch-id: 6e1117694a53a0059b145ad4751ec204cae0db35
--
2.49.0

