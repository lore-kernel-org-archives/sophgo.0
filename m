Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3A0192B7D
	for <sophgo@lists.linux.dev>; Sun, 14 Dec 2025 22:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765752426; cv=none; b=e8EmlPeQ28UqPy+22DsRIlgZzjyGNbiSJVAxqJAIgT3td1e2Mj3QMf40f7Gd05SepaVbJji2LTahqklndmoG7XS0WNUO7wH/HSgyBx/IzVJuVqbS/uMPR6sukPVjXT6TcDdXPJwvq6VuHe0RoKAXAzPUa/g0zDGwezHrI5ybGkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765752426; c=relaxed/simple;
	bh=fmzVuHJPOVl7ql9T6pRIoZrq1X2FcL4mYnQt2L9ZlyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F0MoVyJWnzU1cEB97es4UY95VOUCebTzJv1NkQwt7TFKKoOWt2Zo8N8KBM5p3TklTXntTkhxuPxiqrfLfJ024SFKsSINBi39tPMoHbHY0K99h1bNp+sc5iaSsIn4r4V40IrixrM7sp1u7DsKh/MGKbAPe/FL3ziN/6vh76Ll+HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7SgSQXR; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7SgSQXR"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-bd1ce1b35e7so1985522a12.0
        for <sophgo@lists.linux.dev>; Sun, 14 Dec 2025 14:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765752425; x=1766357225; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AQSX2LSFXSd0QzrN4pi98DPbRQ5Gqu2d9o2DvTxsgxI=;
        b=k7SgSQXRmBCQjqD0JSiG4TkMsta1yB5BVCdz+TN+u1ZswN3ywVLgKfX+rFUvfEE8Bp
         6zuei5OkDs6lwnpGwIbvNbzQ6/yta826hpFkhCAWuTVRlvbHHnIErC1OEf3UKx4tQEca
         zc8Dyi+Lqs1BB0W298qukCyqpUsNim1cJ4stqYAX5MN1DxWolIkGI0HLDl2DEzxijeMj
         X+yu+JnWP4wCbRYRLfdwOKxLoaC0N+4+EM4Rdq+k8cLic+lZvFWFgR5t1QT0jLSf/nCr
         brsrDeg8caYk9sTWGV4j3TB4x/+WttBaatMxQfWZyTbwUlVLrSczQkDJTUds2hSNr0TJ
         YiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765752425; x=1766357225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQSX2LSFXSd0QzrN4pi98DPbRQ5Gqu2d9o2DvTxsgxI=;
        b=Hl91KJ46x6CL8H+ddSSVA7xbZ0dTnVwoCVe799v0W8OYn1Qmr/6bMv+1JRTAI/nZ7j
         nCILSHBM2EuNwwe/S1A0zx4S8v9rhnzP0R+RRxB2+XWjEbzW4bu9G2MUoAwcD1G1j3FR
         yt4ve5uulz3zXE60Ed9lgw9ePLkTLuFDNB9w0aJz+RvWvqAOoNqynYCZqektwymYdeef
         QLndiC1tsJwpLaTpQFd4izx9vLqvCQO39vsgywakQ43IHxcwTPSS5IieUPkc4WqbnxA/
         a9YnIrvXRbXF8wdqKFXB4+aQGQB3eZmX3Vmkm+FvTfTkVKO3RBGRfG9VKyrh3eweLpyt
         GH9g==
X-Forwarded-Encrypted: i=1; AJvYcCWAFfB4SjIJ7+GsFeMmPoXDXS3Em+D2XdIAUQoOZkZ+u/NeyM4Ffov1kxuaWRI1PYsq9mYcDF0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3TQi+4W+YyszXMih1fAqU3aXCXQyDShYZ2/nGBSoN9fRcVmd0
	rkqEIMuSbI6fNIg5EMieOfJGR8Vyb38apNmCD/TcZijhuF8JUKiygBsv
X-Gm-Gg: AY/fxX7l6ZAF8r0TnH9GEWwt0Igt+I5BCedoUr6rPO++YOjD20YCJgaCV8NKxKz/yKr
	LY+HXy4MsT1o5oOD+VCdIJBbhvMnSWARiiuiSd/PhAejl5dUFc6CeqqlA5uwTlmtWiFp+Ux5M0I
	sQuHcyDLunChSsWxqB4QWHAzfY0La+zouX8jm05+73DSUxxail0sH1xs7Xfd+gQhdDHOqGNvnLV
	pZVR0No03DrbOqY5noOb8wyF+w7+QK70DranrrTVgBOimalqZPGHc30QlaCz3FRAlLZ1CJLDZul
	em9v3keAwWEOv/iahG22zpdbzAmBx++a4L/BSxsxXuaMPOrExU71yR5fBbf46B/OyOEMJbHV21m
	ecIT4kagycpwqCnI4VEwTbqVbPa9JbylkG4E4vQUgPWez5d+1ZIkJOO+VRddsxNTdZrG8Ke6R44
	THC02QFCFkNg==
X-Google-Smtp-Source: AGHT+IHjCMwEMhrIndkSHywWXlymB1MdGXVU8RHAOoQgNJtfIdi9BRjQB3e8/tXrqTx2dBHPGX3TJA==
X-Received: by 2002:a05:7301:f10:b0:2a4:7b65:1a16 with SMTP id 5a478bee46e88-2ac300fd6cbmr6728297eec.25.1765752424562;
        Sun, 14 Dec 2025 14:47:04 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ac190d3d14sm25081258eec.2.2025.12.14.14.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 14:47:04 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: "Anton D . Stavinskii" <stavinsky@gmail.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v2 0/3] riscv: sophgo: allow DMA multiplexer set channel number for DMA controller
Date: Mon, 15 Dec 2025 06:45:57 +0800
Message-ID: <20251214224601.598358-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
the SoC provides a dma multiplexer to reuse the DMA channel. However,
the dma multiplexer also controlls the DMA interrupt multiplexer, which
means that the dma multiplexer needs to know the channel number.

Change the DMA phandle args parsing logic so it can use handshake
number as channel number if necessary.

Change from v1:
1. rebase to v6.19-rc1
2. patch 1: remove a comment placed in wrong place.
3. patch 2: fix typo in comments.
4. patch 2: initialize chan as NULL in dw_axi_dma_of_xlate.

Inochi Amaoto (3):
  dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B compatible
  dmaengine: dw-axi-dmac: Add support for CV1800B DMA
  riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel
    number for DMA controller

 .../bindings/dma/snps,dw-axi-dmac.yaml        |  1 +
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        |  2 +-
 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 26 ++++++++++++++++---
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  1 +
 4 files changed, 25 insertions(+), 5 deletions(-)

--
2.52.0

