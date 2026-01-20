Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E3533C50B
	for <sophgo@lists.linux.dev>; Tue, 20 Jan 2026 04:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768884139; cv=none; b=GdbpxVCd4ZXc07Zvbt2Dg9S03uX6n5Oa6ThQ45cpuTknGpFsJIz7FUaejyZqV1c7MShxiwTAFq5Cxlz5PYADf20vP3lsAss2/6c2+VAGTeJYIli6HivpjN1kmRThFf38hIjHgRbD4YSH94duKirjvj4lrwOMnGPzRWWxe17pPnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768884139; c=relaxed/simple;
	bh=n5A0OXSyk7lo7f3jHURyz0bX/5X3lYhpTO7Z9MO/Uec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hD7CCbx6zrgyFW78YqMe18aI/oiuVzXha7lQEbG0RwsQGiNd+agJBP21MvVQoyBcyGSORKan20gahwDyLRsdGEOwowoKJy3DXoLT7iW1l4NnAyrZH308P8KDC2esqoaAtMtLpQ/I86suWoCGXmC2RXWq1kfXJ2H/1VY2g6vbaIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EvrJfzfL; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EvrJfzfL"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4044854464fso2537636fac.3
        for <sophgo@lists.linux.dev>; Mon, 19 Jan 2026 20:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768884136; x=1769488936; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2Ldiltg0ilm3GITC1FlZ3jygue5ViLbnCHXlSmV/Sg=;
        b=EvrJfzfLlhlqJ9Mvar66OTidnXZ7T1NGN0s+blQyzEwNQsfBTnuIdEvOqaxWGVm+tP
         vpuA/dsPMNGuE+hJfXunlhlT5GqUDCz1TGJWWeMUITkSkgZZ9iJp6TPLWwV/MnIklpx4
         0H1nVChwE9EilGGmt0M5t/om+5lEH70WaCl7oHEH7nzGXybP4+4JMjNRqH4UZa59rBy/
         aKY2Mhf1uWdsA/6eVlk1SZWkHXCi96QrKwTSs6XDiEW8OMRYDpjgJKGo1cJgIOlqKmwd
         59piCJuoxTKmDh55vUopw0fAQQKbZ2en4R8QocSFhZajriFrzBVF8rLuz1nsUuKjn92Z
         b2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768884136; x=1769488936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i2Ldiltg0ilm3GITC1FlZ3jygue5ViLbnCHXlSmV/Sg=;
        b=pGJYdeiWKNeU6wYs1NPpEJX+2E9rMbrpGo1SxWLng6Zmfk+C1pBJVF7001hjHXZOLz
         5SHvRYgKewIy4hdy9xk9BpoRY5is6KeJa6QKWvuxgIBrCDorTQU1tnSthLUy1Nyaf3NB
         sW4bmhEWC9a7xN17l5AI2w6cQySMyC5Zaf41mMr2Zn0JVDUtZ65vwsHPa0cQcaM1E6P8
         UKKIJXnE3mgMZTbujr6wpauy11QJZQfka8ggJ8029ul2+sbcOfca0I15LpJQbanwwgdI
         qqkL8M+eLYbMRlGrgumUYFQMdGcZHCcSpO3jhV+K3Bb5EcekEWvp1AXU1u09Ia0JgCGB
         yNVA==
X-Forwarded-Encrypted: i=1; AJvYcCVybOJe0EWv2g2f0YkYryDLp5pKWJNIpEqe/qJ3BA0OAiv81DJ4zDpFnWHRHQm7U3526dIZl9M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9jPbyu77y1KSTiU4OUfLDSADexh0kxjHhPMR84KhdufZHQ5bo
	cbboH6jOh9F09cymr75nMy8TpzP2HvMinK/CH4kZ0d9UQE0TRoBI1y4wMzhOAA==
X-Gm-Gg: AY/fxX4HLEWL0LPlKb2xkuTuSwz8qPl+vIXqR44AABM9h040eFttUk5BYniFsScc/Jx
	VdK3CtfNVzslvrNoGm5imCJhHPC6TLSnQyEbZl3FphIc8va1F4s3jp/w+zDwN/v4hqQ7lSQHS2H
	zN37Is4a+MPG0xT4lKy5Mo9wmIosL6bljPnNJNHg+dhBwgtfvLo9FVmlNen0/mr3ZDeNJFYQaqj
	rP5Mym+UeKYtP5BQd1FBMSz8O21L1FO3Kp+vfBiHg5uA3H+6uqZEXtZyexmNgcZGzKQ0lUhbRhi
	sjKqA5Yq84N7icjMXx4aomW3bgO0kh5rH3MTMTTgqP5e2sWUdjKgk0M39UBmdPI356X+caSlDRt
	WzibO59wnJr+E4RqcK0IqT4SCyWXpesGffUEPc/chWrzVu2p3UlIxTgN8giRwXuC8WLLrK7AqAu
	EiVpDz2GtpeQ==
X-Received: by 2002:a05:7022:925:b0:119:e569:fba6 with SMTP id a92af1059eb24-1244a7195b4mr14136099c88.21.1768877353611;
        Mon, 19 Jan 2026 18:49:13 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac585a9sm16856206c88.2.2026.01.19.18.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 18:49:13 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Yixun Lan <dlan@gentoo.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guodong Xu <guodong@riscstar.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	spacemit@lists.linux.dev
Subject: Re: (subset) [PATCH v2 0/4] riscv: dts: Add "b" ISA extension to existing devicetrees
Date: Tue, 20 Jan 2026 10:48:55 +0800
Message-ID: <176887176536.427065.4468747981087466363.b4-ty@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260120024855.iCWV6cvL2IFzEcYXsT6n52e0tE9dl_zwPeC3aHQO5-M@z>

On Thu, 15 Jan 2026 07:18:56 +0800, Guodong Xu wrote:
> The RISC-V "b" (Bit-manipulation) extension was ratified in April 2024,
> much later than its component extensions zba/zbb/zbs (June 2021). Recent
> updates to the device tree bindings [2] enforce that when all three
> component extensions are present, "b" must also be specified. Related
> discussion can also be found in [1].
> 
> Patch 1 clarifies the ISA spec version for canonical ordering in uabi.rst.
> It is a trivial update, but can help readers reference the correct
> document version. Acked-by Paul Walmsley in v1.
> 
> [...]

Applied to dt/riscv, thanks!

[3/4] riscv: dts: sophgo: sg2044: Add "b" ISA extension
      https://github.com/sophgo/linux/commit/f16ae81b80ca4e721f4c4ed1f28390115f7721eb

Thanks,
Inochi

