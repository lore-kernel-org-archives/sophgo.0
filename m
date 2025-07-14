Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E0823AD
	for <sophgo@lists.linux.dev>; Mon, 14 Jul 2025 00:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752454117; cv=none; b=KHqWQ9VG6mEOYTzEhQhBAaGre3NZdjSwJDqjpyAhrWKfO1b79Gp60bf2hq6IIzxKX74LiEdfMchitEuV2DngXWY5ZJTCr/hMI8xGMOfLnNsEKoFDowSKlQ3F5seezGDXchucid8jsMa2uxnBLqTD9s+ctwCq295SXAlOVNcF5fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752454117; c=relaxed/simple;
	bh=qBVLc6fBUdI7Bsac/u+u0fq5ykRn1Yj7Fj0fyW93xMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G55g8FTd/6A1k7/R9K9fQCGa1riH6Bm2LFbgv0zj8Gj0P7mmuGNWYZ7xgWphD/KfO7yq8VKiLG6h9xGACmwaFXPZimEgAjcPdwOqjZ70JIGdGSDDQxmnlPvW792WfyOhJRgpxOzoGp4d/Jj14ZXDthiZ8A6WegXSY2hJGcAZ/z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JuETcXNm; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JuETcXNm"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-74b54af901bso2349788b3a.2
        for <sophgo@lists.linux.dev>; Sun, 13 Jul 2025 17:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752454116; x=1753058916; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlGfg6+RS0/8umWyykq+45w1614vFv0m/mmrlsZHej8=;
        b=JuETcXNmxAsn08pLuiijE3hgwumSiqRZcmXArzRN+uxPxjhrGLz8QbydCe1Vm/nnEz
         qPRRBbJGnNPfnUkYWz1GhclrbtrDx/t4AOfW15EUdWuXld2DaR30CYLeoeM4vxzm4NIy
         skTSlV/StXehz6gBYOqRPHOrEa21XsNT/nEEGRQTLnUf48Sm99/Zh1Bmbs8WlbptQrWx
         rPnVgcr8k48ovvdKiCmnco03rjk/n5N9RmFGrthij/uRcXiFsSJcUy+1FUS2l2Hsn5Wb
         SGlkJui3gw1Q44Ttt1Jgv5prBPQijEMUGlLdT70NpI/rzWwRqVPwhQagFHN3PLFxgqNN
         gPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752454116; x=1753058916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlGfg6+RS0/8umWyykq+45w1614vFv0m/mmrlsZHej8=;
        b=i/PyVMsjkhExi9N6CIzVFfsNBphIwJCyc/YBi9nuQS3DpCV3Q742d2y2RxCHdyh2Ux
         oCT6VHTsXTWSe4jHlCsjkQpSyMKb9LoqohEgbrzLPCpggNXzeGYHAwoVX5YXQSFPfMCa
         qe/OfnD8Y6JG6MZ2RWfLwmi7JhFv7tEQIuyKKdZTNVtlP5GqH9uIGuFFfctCY4YGaNtX
         6GfYfCsarqlqNOH/51CTEqkY6zNvpGtEqPa/vG+aIOcmSx9IZbprzfN0tDDpPu9jd2wS
         KauK/JxEqiz3Yhh3Q24Sd/TgcpcAt2uHL1JsgLPQpxgmFhtaYSjN9Sdovco0+A//o2EI
         J3aA==
X-Forwarded-Encrypted: i=1; AJvYcCWnFlanpuIWoaqW+p9GzUAI+ZQn1sYsYunDpcKlT0Ab+wZnc3Tpasx+gMu+h9chcVj1Rw55ZD4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxU8tE9leAt4Myz+C28BZdjlpsBA6Mx+hYxL/I0SKY+NJknVJ78
	dmoDjpjVyiET4fRBlTWExG3eX77Wwhj6iIbbRJhZ6xSAMdd5H5Oi8glf
X-Gm-Gg: ASbGncsyNwCtSG8QfB35TKgvat1KsqtuUNgpoAtmfPMKzXE1CaYV/viKoIV942FToVU
	AzR4OuIkiLBTyKUCgCaW88OK8Giz387TMTifzl3g41tW2SFOJfe8xfknRIbADvC4xjxRt9TMsJZ
	VJgsn6L7QRnDMGg7nB8V8TELh2n4UseKHxnHgubihjuvuZrzljD7TgudJX9yVLjPpxApYn8VGbU
	WZl91nFl8dXFldewL/PDwAKngOziLdtCDzKJwVdkfPJtmD3yQsSieO3TBXKnU052gOJAI6oB9bB
	G2KIISRLNJNvFacdgbT9RO81OGod9seI5EQ0ACY4nP6rPz2jqWt2CyikW9eyI9nzvhIor9Rhnbc
	OY17lbgdoosYtnc2WF40VWg==
X-Google-Smtp-Source: AGHT+IFKzCCHqzYjKRAR+ceG5nX9KmnkL4pm9nq+EucL+t8je9ydIAD9t1s8XHS9iTVp8oXMk1PN5A==
X-Received: by 2002:a05:6a20:c906:b0:218:5954:1293 with SMTP id adf61e73a8af0-23120901f07mr22755505637.34.1752454115669;
        Sun, 13 Jul 2025 17:48:35 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b3bbe5baf70sm8884319a12.32.2025.07.13.17.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 17:48:35 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: devicetree@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Add Sophgo EVB V1/V2 Board support
Date: Mon, 14 Jul 2025 08:47:50 +0800
Message-ID: <175245405814.143339.1204072050512603486.b4-ty@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1751700954.git.rabenda.cn@gmail.com>
References: <cover.1751700954.git.rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 05 Jul 2025 15:39:53 +0800, Han Gao wrote:
> Sophgo EVB V1/V2 [1][2] is a prototype board based on SOPHON SG2042 [3].
> There are many of these two boards in the hands of developers.
> 
> Currently supports serial port, sdcard/emmc, pwm, fan speed control.
> 
> Added ethernet support based on [4].
> 
> [...]

Applied to for-next, thanks!

[1/3] dt-bindings: riscv: add Sophgo SG2042_EVB_V1.X/V2.0 bindings
      https://github.com/sophgo/linux/commit/a42a510c1a9119a8413e20fe09ce3c3cd85ea7db
[2/3] riscv: dts: sophgo: add Sophgo SG2042_EVB_V1.X board device tree
      https://github.com/sophgo/linux/commit/1bf2708394942e047e08146dc8d2a34c091280de
[3/3] riscv: dts: sophgo: add Sophgo SG2042_EVB_V2.0 board device tree
      https://github.com/sophgo/linux/commit/6ca1c3d005cdb9bd619a2dec6ed63ef9ba29eb37

Thanks,
Inochi

