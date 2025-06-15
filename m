Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F2D27B4FA
	for <sophgo@lists.linux.dev>; Sun, 15 Jun 2025 15:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750001937; cv=none; b=cSlXZ7uytS/ekjY93nIRI3ztloz+ewSQBgatMliX68t5ZeKKjLB2bJQlC0qpWq1I1c3n1JRnAegSLgWCsdimDLED2aWM6PZ7veIVMZcyltfOVyggG2x6A3HZIh9zzOIQgaIR9lMdELlONmHrXv4LrG81JuKvNO9XGHcG2OsfyFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750001937; c=relaxed/simple;
	bh=Qe6Shilu7HNdH7Cf+5SwJEQwPbJdRgtKIZLinXtUYwU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XNuVOkdzmfS9n73ywVcbkmnDWu403LERc1xP1RaD7SMhLt4L1BgqcEm1++INmJ2tv4YIOxg7mCFmmlmcIt1RNVJRIUTIwe/uASP/q/ox5kZ7WW3CQo2lw3L5YfgODE3rpJXbLwRlch1gYHXuYQSIPYIfWPIyG3BdC3fv0yR8gC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YnubOTbo; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YnubOTbo"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-450cf214200so31064705e9.1
        for <sophgo@lists.linux.dev>; Sun, 15 Jun 2025 08:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750001934; x=1750606734; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qe6Shilu7HNdH7Cf+5SwJEQwPbJdRgtKIZLinXtUYwU=;
        b=YnubOTboYZK8twArq+Nvv79BzViweviIVPJLN1m628NU0HDv+JTTKzlva1exkMlzsy
         iZaceBmL82jjdjz+DhFQWoRQR73vtvcK9LPPL0AiKRHCswFXwSuBlwXUq1da63J/PolX
         XNUYCjWBgDweyxVhUUe5GnzJq1TSfow6Ejd640NVcu7l7kToK0ww5nIAeLADzF3BxdmF
         3NUzr+AFxdDJZNauwmfe4wwwDnSHdxdYsM+I14uFXvAn7IZye7g7yATw7+owQZRmRanY
         0xLoMjJDjhUW0h7AoVzmcQBSRgdYJI7wXVr2NxxQ1jbRP7a/FNfEwH7RUScqb7P8ExzB
         +3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750001934; x=1750606734;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qe6Shilu7HNdH7Cf+5SwJEQwPbJdRgtKIZLinXtUYwU=;
        b=o+Ups8zfoMBH2xiKKi1bO9SI1GIfCb0Kfk9xuj1in7DotYs3yfOkxfVul0y+HQUHk1
         Sz2C8StsKUq8YkAH30uQQrxLAxKuyac9k4l2aqt0wWhmbMhP50p10vDt9geNfjrwn5Em
         KagrQqOR1q6c76cHuf7tBJA5xSIcisCVVvvXDrkQe0uaF3mY8iaME4mlBcF6zzPx7MLe
         okKPtNtL2eRyPi8eZY0Zu5VtjCw6pESL5DJIOuR6PAvUvWzeMuInBz4saMZO1Qeluc7q
         mfKbvFDx25bX3pnhKmYiUUpC9IMbgRrhDGeTY82b5DAJSOgTjTdnEUjljSXkfX2AIYGl
         LQMw==
X-Forwarded-Encrypted: i=1; AJvYcCXqrCP4LpzNc7cN7npoXihHQ4qWT5r6Zz2OKjEVBmSYCSrmC2cb0y+sIF43KeINg1lb4bG1qYI=@lists.linux.dev
X-Gm-Message-State: AOJu0YweUHX4ljpp3A9ElfWnEK+V6T71qCYSdBhNt4SaQ7vTBEap0YcC
	/0xq885rz6jKEW5ULZmEMNJByl4Q/w6RJ/iXGrhz6CKU3YHJ10YyjXrnJF60FaJlnDE=
X-Gm-Gg: ASbGncuOyo31B92EIokMR+g4KCgXtNY1VqB+gP7JDt8JOOeTFPE1Ci4XSzoAAannru7
	l2uIHw11oVd51mEeHOYQycgFiyHb5ZYHNNuErThf9qpwo5rBvI/suPil1yR5i9gK/qDQH6oSmPJ
	dOT3k2els9GtMQMS9KLzZ7JwYCNThcHmUmZh+4IoXUAs3LvPoOZ4mxsedOS2PzXO/kCgEJztf6Q
	G9UsfNTRI3ec0gmD+8DzfeLijsXtuXDlZyyR5xa81QqX4EMR1c6f6+gvofQnPxrB9E1qRyiMzpt
	goZxRW/3aFPgm69p9Y1+O8dshLl2fO4beuUiHomm1UUqAGI3kCU7m4sl5r0Y6rI8GbxB/d0GoNX
	nIT1tXw==
X-Google-Smtp-Source: AGHT+IGM1N0DYCxpTEmsEntEQYJyHGWXdzg0ibk6tQMpo/pKHCYqDtPWIrJWX2KzhfQvaFKskAJ3Jg==
X-Received: by 2002:a05:600c:46cb:b0:43d:45a:8fc1 with SMTP id 5b1f17b1804b1-4533ca5f35emr60057845e9.4.1750001934191;
        Sun, 15 Jun 2025 08:38:54 -0700 (PDT)
Received: from giga-mm-7.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e232b68sm111179995e9.10.2025.06.15.08.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 08:38:53 -0700 (PDT)
Message-ID: <efce5e1909ead19a46c87fa36652be70e9233161.camel@gmail.com>
Subject: Re: [PATCH v14 2/2] dmaengine: add driver for Sophgo CV18XX/SG200X
 dmamux
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Vinod Koul <vkoul@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, Paul
 Walmsley	 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li
	 <looong.bin@gmail.com>
Date: Sun, 15 Jun 2025 17:39:06 +0200
In-Reply-To: <20250611081000.1187374-3-inochiama@gmail.com>
References: <20250611081000.1187374-1-inochiama@gmail.com>
	 <20250611081000.1187374-3-inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Thanks for the patch, Inochi!

On Wed, 2025-06-11 at 16:09 +0800, Inochi Amaoto wrote:
> Sophgo CV18XX/SG200X use DW AXI CORE with a multiplexer for remapping
> its request lines. The multiplexer supports at most 8 request lines.
>=20
> Add driver for Sophgo CV18XX/SG200X DMA multiplexer.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Successfully tested with USB series in host mode on Milk-V Duo Module 01 EV=
B:

Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0drivers/dma/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 9 ++
> =C2=A0drivers/dma/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/dma/cv1800b-dmamux.c | 259 ++++++++++++++++++++++++++++++++=
+++
> =C2=A03 files changed, 269 insertions(+)
> =C2=A0create mode 100644 drivers/dma/cv1800b-dmamux.c

--=20
Alexander Sverdlin.
