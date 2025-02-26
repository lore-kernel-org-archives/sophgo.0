Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EA427002D
	for <sophgo@lists.linux.dev>; Wed, 26 Feb 2025 23:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740613398; cv=none; b=oj4OR8v0/kYr0h9V+zxVDt3PYmsI/ljpmIMtfmVCTAKVN8tixzod6pZrwysHIs88ZU/kYhSwa8syS+NDJ+HZlMJaDBXUIW+yGEf8EFAMIUM55ozukPSSJwgs+CIRxlnlpoVzlUlL9cbA6WeJIGiKMU+CzpwisMe0yLB1pkmN+tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740613398; c=relaxed/simple;
	bh=Eh0Eo/Fkv7rimj8T89jrNFf3IIi3ia63rPOLD+dghLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C3Mo6Z//qw3GMTbYMzgVAFUNA7+HJmgOVnF7VLDbtKpldg6EwI+3rtUJjpNJD26fPF862go5yj588Q32iCKRGRJeOTtG/2Ri4wq5r9UOGJoYHqVqPBnh7Kq+AemD1t2Fe5SFD6V6vxbY0/st1pc9HfFXiYM/dv39tQ9jztLXxWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hi2YzMuE; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hi2YzMuE"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c0a1c4780bso33196085a.3
        for <sophgo@lists.linux.dev>; Wed, 26 Feb 2025 15:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740613395; x=1741218195; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BPCE1EwJy/+4tZvxiVTXnB1pR5FYwCTo9rAvyHj8R0=;
        b=hi2YzMuEfO+DcE84IY7zgyNYyAlFr+ufFgNs2bUUC02UP9U4eWlwe/xhL6YMGMCgeW
         DgZzTPsgTH+F9ceY+lHFP5zBsa0piOBXX2jAEWsv5Gm/eTAYJ8efeAjFDJ5xebl58GrP
         EP/Mmv+IhrWp5HvH1AYmz1OOn3oDmHVYuqWVsUUlbWYyleLYceHYKxaLw8785OElbBze
         78bb7rcBJgBrL2RtSNBlmIFzAVEKjDG4p4zWn/Ac8a23cYKfT8l56z7bfBlbqX2p1TLE
         R/aQ3xbseqE4MQi5AhF0q7ns1nS57jW4uo3qfaVfgtd7SOaJyvAVrNy02x9JkfajfCnJ
         4pZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740613395; x=1741218195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BPCE1EwJy/+4tZvxiVTXnB1pR5FYwCTo9rAvyHj8R0=;
        b=UugFWLdSuCJ8Nf1JTea8DRPNzu/m1NKuTtB7Gq+nl2kZgaTMvueX1rq4yVymkrnFGa
         UYznHBUZ4U8x9M4lTbVQ+sfZSVLZTHtmd1JvM5VcpmTqZ/kqQvCqYaJUwRThetzzPnIz
         orx6mvUMDscBWOrwouyduKuZlzsna7nzKvZWZD3/GxmdXx0SWG+Az5hUXIxQYOGeZC/B
         JMLscxlBQETeUpaoyibdN7a94A5+nP5f865NyrbkmwwDpfhDoYnJu0RpMfu7Qt+o+jEl
         qfDnah0F4xojKLUu1J6CfJy1caQG7RAPrN3UaUNhHTS3jAE49FnqwzqVIyEHA1vn9aSy
         0UmA==
X-Forwarded-Encrypted: i=1; AJvYcCVv3zZ5nVrxwY+imCV1aNzogMIrf9THKlncQvL6fjIUP3CuCj/6Hv2VASHvLNEEfM5vb4i7UGA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMoP/9BRS90p8q6K8sc3hsU0371rpQnGPNUrycOl7I76RTOVxN
	rk1RFjAgmGE8ed+aFLi6cWHVcwO1Ja+fwUFEU0GjyOiqmT93u4uY
X-Gm-Gg: ASbGncsW7409D2OA4z61In0uC2sI1spOW5fLoe/SxEEySGed0mXBY0awAWjscJ/u4IE
	8TYaFognmpB3XjOUa+u4Hl+VL+1FpNovveivsneaQTyWaBgZtFZ2ht2gZwZfAQQ4yyM7MKkZTIH
	L8kBdKgBXlNuyZfE0q6aVeCaonqmm1CxrUmwkr3anC46C4FgKK3nkkSQxq3yVGAcxOOXt4XDuEm
	87S6s4+mL37MaPl5r9fdoGwoKNJGcfz4WlrrzDts3lZdQlXj7LQ50l+z4CsyNhKwHxGHKIGSd26
	Rw==
X-Google-Smtp-Source: AGHT+IExZ166ZnKNMVp2sWPEye4nK9gUSWKtplsD+DW3kIJ2K1CBVm+kQQbvv+biiRYF9M4XnPhnNw==
X-Received: by 2002:a05:620a:198e:b0:7c0:8978:d1e3 with SMTP id af79cd13be357-7c247fcc139mr765759485a.46.1740613395229;
        Wed, 26 Feb 2025 15:43:15 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c36fee9b74sm24836785a.9.2025.02.26.15.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 15:43:14 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Guo Ren <guoren@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 5/5] riscv: dts: sg2042: Adapt reset generator for new binding
Date: Thu, 27 Feb 2025 07:42:33 +0800
Message-ID: <20250226234234.125305-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226234234.125305-1-inochiama@gmail.com>
References: <20250226234234.125305-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the SG2042 reset controller reuse new binding, change the device
compatible with new string.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index e62ac51ac55a..2be10cbba0ce 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -499,9 +499,10 @@ intc: interrupt-controller@7090000000 {
 		};
 
 		rstgen: reset-controller@7030013000 {
-			compatible = "sophgo,sg2042-reset";
+			compatible = "sophgo,sg2042-reset", "reset-simple";
 			reg = <0x00000070 0x30013000 0x00000000 0x0000000c>;
 			#reset-cells = <1>;
+			active-low;
 		};
 
 		uart0: serial@7040000000 {
-- 
2.48.1

