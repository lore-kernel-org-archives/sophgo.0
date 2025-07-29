Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E572165EC
	for <sophgo@lists.linux.dev>; Tue, 29 Jul 2025 08:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753777897; cv=none; b=QT+1tRF6wQOiRLlmqYCk2hhf7XlNKpL+fTksxCByG1MAVeAmhx+ZFe0boIMg5r/0UUyuIMK5Cr2L2GaKIegnpNNTBgbE2/LgjrRJEpmWFJcZcIH8D01d6Sv7qZqwsJwODvZ0QGNyaA8kMRQedd8TImMp0CoQvTyJoDew6ZPs0RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753777897; c=relaxed/simple;
	bh=3RI8jIoJyDmrLUwJoPWxZREhJPgeAMp3caffnQq7nBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QoUN7pUgVrUwZOVdHgXQFtu64uDaLiGv4QBTBCKpMepbooR5V9lgRkH+hb9XPN0aAUd/OR0Mnt3f2bXDPmGOFZ8U+2UrzWCc8dmlLMj+ftENoiVS2Um/FUxQjQHK9wfpH1pHq8KLAMdZyVwvUKpxb+SiwT5CnxPuO9E0mjn/oBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bp9PJGwx; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bp9PJGwx"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-313bb9b2f5bso5048328a91.3
        for <sophgo@lists.linux.dev>; Tue, 29 Jul 2025 01:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753777895; x=1754382695; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V3tQDpY9kmcpxqJo02gP5nd31GjHYrw3D1aQf8x0gRc=;
        b=Bp9PJGwxn6qvMK5ayhKTmMl1+VZblx9VjtgCaYmR5b+/qwXwzJ9aQx6a4yFkUCiWWX
         HpoRzHZMDlGlu+h+/0E4OHc/E03HuLNjwA3RfHi9q9j4KtnqritJgHk8kZAzDLlovkyn
         vcnoA7s5gizVO3ohcOIjDhtfjNPuRdedwNU7fmfFwP7F2dWKm69kIhXimgCeG08lSZ/o
         8GqHwi/c4bkCCwiB/x5tevGec1G/y7OcI87wO3jtuK52EuiK8rToAfDnCeG6ZS7aR6SR
         X+vLFbll4O/F7ylCcg9qvzRJvMMfTXyRKD/PCTaXBAqmnSqdlM3UIdo5sPDPA1kagyZg
         43xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753777895; x=1754382695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3tQDpY9kmcpxqJo02gP5nd31GjHYrw3D1aQf8x0gRc=;
        b=DfKP0bfc0+kYINpNGo26Q5KxPnjN/9QJSZRtgO7djp/OWPdFP5LylHHPsCXS0hcKb8
         Wvgdi110nuMsQifwVlOnw6djoJinZvY+f7ZWC/vp84RjRFU/dS97W4PwME42Za1MbIQw
         EOip+ecMuNKqOqhJVxRH5DeSw+lkuqNPRMbpmOPDMh6bDUwczc8U3POYv7GFWoG8C0Rl
         vJaQ1wdSCBUtEkTCnjIC4rJDkVQhDTQsUlFRF75J4PU157v0YYeLjNmtvNUpDsCXqPaM
         I3EOsndw8VDnEEO0pNw4KNosSiAcLgnH7j/wZV0pQ/lbXkcdPYnuwySMSDaWTyuiOYIe
         uvaQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7zXG+f82OQvw7lJSucbrUVC8oJT1lTap2qdbvhnW0NPFDirEzFAE/0SvpP1hxomfihugHVto=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+UYL54YRKgtwTYRBzmiHyGlMCEr6jU6iYTztfTzyJRVnLjyp1
	DMCZJAWf3eEtHCUclMDiF57ZsBWTCRfcoA3MyLFLjFzq1HsibbTKcWQR
X-Gm-Gg: ASbGncu4pIHRgiG+g0eO/O1+3rLRL5sdNRlvTjTvBbJLuAgCqvv0DVZLcMWZv4j34np
	c8PmDRNR+tJ7Y6QlaC2CEB/TcsIDSw5mzAf1IO8zI6I8wwWdyIAHAVPjfeYxGD6lfgot1HVH7Xq
	tPgUDnf0x0wO8TF8IgSm6RKMtCcqH3h2RDqepWC16Dr3UtzvM+7x3FoyVBl85rUi8Pz5tDBefo/
	8dzPaMPjAp307qo5ja8F1YEuzz1f7BZgHau1DQKZXyVEBjqsUnHGqcif//qZkPLFBuxCcG5H6fq
	b0GZ3tyrJMbblzB7fu8Kj7NhNGd3j/tt41Mh+3t3DKjDUXgVrmSDBTq1o86h/TKoF4QMIx1V09K
	nD6EQS3jXoqWTGuMOUGOedsZEUpeq21L8
X-Google-Smtp-Source: AGHT+IH3/A1CboxM+y3QmvNziehjws3MkOhzin8JJlZv9QPmsMuudb9IbcMH6qSkoi3W9mg9v6j4HQ==
X-Received: by 2002:a17:90a:da8c:b0:312:1ae9:152b with SMTP id 98e67ed59e1d1-31e77a027b8mr18810110a91.23.1753777894979;
        Tue, 29 Jul 2025 01:31:34 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-31ec91fbf4csm5462503a91.12.2025.07.29.01.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 01:31:34 -0700 (PDT)
Date: Tue, 29 Jul 2025 16:31:01 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: Add C906L rproc for
 Sophgo CV1800B SoC
Message-ID: <jcpr5tg7jyyyqmaujegeuq5j3dqz4rrgxfz73rl55l3jibtq63@3w7bzux2b2je>
References: <20250728-cv1800-rproc-v2-0-5bbee4abe9dc@pigmoral.tech>
 <20250728-cv1800-rproc-v2-1-5bbee4abe9dc@pigmoral.tech>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728-cv1800-rproc-v2-1-5bbee4abe9dc@pigmoral.tech>

On Mon, Jul 28, 2025 at 07:03:23PM +0800, Junhui Liu wrote:
> Add C906L remote processor for CV1800B SoC, which is an asymmetric
> processor typically running RTOS.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  .../bindings/remoteproc/sophgo,cv1800b-c906l.yaml  | 79 ++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..2061c2fd6ba343c09b1a91700ea4a695d2b57f81
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/sophgo,cv1800b-c906l.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo C906L remote processor controller for CV1800B SoC
> +
> +maintainers:
> +  - Junhui Liu <junhui.liu@pigmoral.tech>
> +
> +description:
> +  Document the bindings for the C906L remoteproc component that loads and boots
> +  firmwares on the CV1800B SoC.
> +
> +properties:
> +  compatible:
> +    const: sophgo,cv1800b-c906l
> +
> +  firmware-name:
> +    maxItems: 1
> +
> +  mbox-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +
> +  mboxes:
> +    description:
> +      This property is required only if the rpmsg/virtio functionality is used.
> +      (see mailbox/sophgo,cv1800b-mailbox.yaml)
> +    items:
> +      - description: mailbox channel to send data to C906L
> +      - description: mailbox channel to receive data from C906L
> +
> +  memory-region:
> +    description:
> +      List of phandles to reserved memory regions used by the remote processor.
> +      The first region is required and provides the firmware region for the
> +      remote processor. The following regions (vdev buffer, vrings) are optional
> +      and are only required if rpmsg/virtio functionality is used.
> +    minItems: 1
> +    items:
> +      - description: firmware region
> +      - description: vdev buffer
> +      - description: vring0
> +      - description: vring1
> +    additionalItems: true
> +

Why not allocating these region dynamicly? I do not think firware is
always avaible before staring. Allowing dynamic firmware give us max
flexiblity.

Regards,
Inochi
